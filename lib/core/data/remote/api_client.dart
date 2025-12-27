import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_response_code.dart';
import 'api_upload_file.dart';
import 'models/error/server_error.dart';
import 'network/connection_info.dart';

/// Http Request Types
enum HttpRequestType { get, post, patch, delete }

final String baseUrl = "";

/// Api Client for calling APIs via HTTP
class ApiClient {
  /// Standard const Header for Api calls
  static const Map<String, String> baseHeaders = {
    "Accept": "*/*",
    "Content-Type": "application/json",
    "Connection": "keep-alive",
  };

  /// The Header for requests
  Map<String, String> headerData() {
    final headers = <String, String>{
      ...baseHeaders,
    };

    // TODO: Add token authentication when implemented
    // if (token != null) {
    //   headers["Authorization"] = "Bearer $token";
    // }
    return headers;
  }

  /// Call Api and handle the result
  Future<R?> invokeApi<R>(
    String path, {
    R Function(Map<String, dynamic> json)? deserializer,
    HttpRequestType requestType = HttpRequestType.get,
    Object? body,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    final Uri url = Uri.parse('$baseUrl$path');
    final header = headers ?? headerData();

    if (kDebugMode) {
      _printColored("Headers: $header");
    }

    // Add the params to the request if there are any
    final updatedUrl = url.replace(queryParameters: params);
    http.Response? response;

    // Check connection before calling the api
    if (await ConnectionInfo.isConnected()) {
      try {
        response = await (() {
          switch (requestType) {
            /// GET Method
            case HttpRequestType.get:
              return http.get(updatedUrl, headers: header);

            /// POST Method
            case HttpRequestType.post:
              return http.post(
                updatedUrl,
                headers: header,
                body: jsonEncode(body ?? {}),
              );

            /// DELETE Method
            case HttpRequestType.delete:
              return http.delete(updatedUrl, headers: header);

            /// PATCH Method
            case HttpRequestType.patch:
              return http.patch(
                updatedUrl,
                headers: header,
                body: jsonEncode(body ?? {}),
              );
          }
        })();
        if (kDebugMode) {
          _printColored("$requestType: $updatedUrl");
          _printColored("Params: $params");
          _printColored("Response body: ${response.body}");
        }

        // Handle the response from api
        return _handleResponse<R>(
          response.statusCode,
          response.body,
          deserializer,
        );
      } catch (e) {
        if (kDebugMode) {
          _printColored("Error: $e");
        }
        if (e is ServerError) {
          throw e;
        }
        throw ServerError(code: "-1", message: 'Unhandled response: ${e.toString()}');
      }
    } else {
      throw ServerError(code: "-2", message: 'No Connection');
    }
  }

  /// upload photo
  Future<R?> uploadPhoto<R>({
    required String filePath,
    required String path,
    required R Function(Map<String, dynamic> json) deserializer,
    Map<String, String>? headers,
    Function(double)? withProgressFunction,
  }) async {
    final Uri url = Uri.parse('$baseUrl$path');

    if (await ConnectionInfo.isConnected()) {
      try {
        final request = MultipartRequest(
          'POST',
          url,
          onProgress: (int bytes, int total) {
            if (withProgressFunction != null) {
              withProgressFunction((bytes / total));
            }
          },
        );

        request.headers.addAll(headers ?? headerData());

        // Create multipart using filepath, string or bytes
        final pic = await http.MultipartFile.fromPath("file", filePath);
        // Add multipart to request
        request.files.add(pic);
        final response = await request.send();

        // Get the response from the server
        final responseData = await response.stream.toBytes();
        final responseString = String.fromCharCodes(responseData);

        return _handleResponse<R>(
          response.statusCode,
          responseString,
          deserializer,
        );
      } catch (e) {
        if (e is ServerError) {
          throw e;
        }
        throw ServerError(code: "-1", message: 'Unhandled response: ${e.toString()}');
      }
    } else {
      throw ServerError(code: "-2", message: 'No Connection');
    }
  }

  /// Handle Response
  R? _handleResponse<R>(
    int statusCode,
    String body,
    R Function(Map<String, dynamic> json)? deserializer,
  ) {
    final code = ApiResponseCode.fromCode(statusCode);

    if (kDebugMode) {
      _printColored("ApiResponse Code: $code");
    }

    if (code == ApiResponseCode.success) {
      // Success Response
      if (body.isEmpty) {
        return null;
      }

      try {
        final dynamic decoded = json.decode(body);
        if (decoded is Map<String, dynamic>) {
          final map = decoded;
          final success = map['success'] == true;

          if (success) {
            final data = map['data'];
            if (deserializer != null) {
              if (data is Map<String, dynamic>) {
                return deserializer(data);
              }

              // If backend returns a primitive or list, wrap into a map for deserializer or cast directly
              if (data is List || data is String || data is num || data == null) {
                return data as R?;
              }
            }
            return data as R?;
          } else {
            // Error Response
            final errorCode = map['errorCode']?.toString();
            final messages =
                (map['messages'] as List?)?.map((e) => e.toString()).toList() ??
                const [];
            final message = messages.isNotEmpty
                ? messages.join(', ')
                : 'Unknown error';
            throw ServerError(code: errorCode, message: message);
          }
        }
        // If not a JSON map, return via deserializer or raw cast
        return deserializer?.call({'raw': decoded}) ?? decoded as R?;
      } catch (e) {
        if (e is ServerError) {
          throw e;
        }
        throw ServerError(
          code: "-3",
          message: 'Failed to parse response: ${e.toString()}',
        );
      }
    }

    // Non-success HTTP status
    try {
      final map = json.decode(body) as Map<String, dynamic>;
      final errorCode = map['errorCode']?.toString();
      final messages =
          (map['messages'] as List?)?.map((e) => e.toString()).toList() ??
          const [];
      final message = messages.isNotEmpty
          ? messages.join(', ')
          : 'Server error ($statusCode)';

      throw ServerError(code: errorCode, message: message);
    } catch (e) {
      if (e is ServerError) {
        throw e;
      }
      throw ServerError(
        code: statusCode.toString(),
        message: 'Server error ($statusCode): ${body.isNotEmpty ? body : "No response body"}',
      );
    }
  }

  void _printColored(String message) {
    debugPrint('\x1B[35m$message\x1B[0m');
  }
}