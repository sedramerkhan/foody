
import 'package:flutter/foundation.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/base/repository/server_error_type_enum.dart';
import 'package:foody/core/data/local/hive/base_local_data.dart';
import 'package:foody/core/data/remote/api_client.dart';
import 'package:foody/core/data/remote/models/error/server_error.dart';
import 'package:foody/shared/utils/print_colored.dart';
import 'package:get_it/get_it.dart';


//todo : token
abstract class BaseRepository {
  static ApiClient apiClient = GetIt.I.get<ApiClient>();


  /// GET Method
  @protected
  Future<ApiResponse<R>> getData<T, R>({
    required String path,
    required T Function(Map<String, dynamic> json) deserializer,
    Map<String, dynamic>? params,
    R Function(T)? mapper,
    Function(R)? callBack,
  }) async {
    try {
      final data = await apiClient.invokeApi<T>(
        path,
        deserializer: deserializer,
        requestType: HttpRequestType.get,
        params: params,
      );
      
      final R mappedData = mapper != null ? mapper.call(data as T) : data as R;
      if (callBack != null) await callBack(mappedData);
      return ApiResponse.success(mappedData);
    } catch (e) {
      return _getServerError(e);
    }
  }

  /// POST Method
  @protected
  Future<ApiResponse<T>> postData<T>({
    required String path,
    T Function(Map<String, dynamic> json)? deserializer,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    Function(T)? callBack,
  }) async {
    try {
      final data = await apiClient.invokeApi<T>(
        path,
        deserializer: deserializer,
        requestType: HttpRequestType.post,
        body: body,
        headers: headers,
      );
      if (callBack != null) await callBack(data as T);
      return ApiResponse.success(data as T);
    } catch (e) {
      return _getServerError(e);
    }
  }

  /// PATCH Method
  @protected
  Future<ApiResponse<bool>> patchData<T>({
    required String path,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    Function()? callBack,
  }) async {
    try {
      //todo : check type
      await apiClient.invokeApi<T>(
        path,
        requestType: HttpRequestType.patch,
        body: body,
        headers: headers,
      );
      if (callBack != null) await callBack();
      return const ApiResponse.success(true);
    } catch (e) {
      return _getServerError(e);
    }
  }

  /// Delete
  @protected
  Future<ApiResponse<bool>> deleteData<T>({
    required String path,
    Function()? callBack,
  }) async {
    try {
      await apiClient.invokeApi<T>(path, requestType: HttpRequestType.delete);
      if (callBack != null) await callBack();
      return const ApiResponse.success(true);
    } catch (e) {
      return _getServerError(e);
    }
  }

  /// Upload Photo
  @protected
  Future<ApiResponse<String>> uploadPhoto({
    required String filePath,
    required String path,
    Function(double)? withProgressFunction,
  }) async {
    try {
      final resultResponse = await apiClient.uploadPhoto<String>(
        filePath: filePath,
        path: "$path",
        withProgressFunction: withProgressFunction,
        deserializer: (Map<String, dynamic> json) {
          return json["url"] as String;
        },
      );
      return ApiResponse.success(resultResponse as String);
    } catch (e) {
      return _getServerError(e);
    }
  }

  /// Use Cache With Cloud
  // GET
  @protected
  Stream<ApiResponse<R>> getDataWithCache<T, R>({
    required String path,
    required T Function(Map<String, dynamic> json) deserializer,
    Map<String, dynamic>? params,
    required BaseLocalData localData,
    bool allowGuest = false,
    Function(R)? callback,
  }) async* {
    final R? cache = await localData.getData();
    if (cache != null) {
      yield ApiResponse.success(cache);
    }

    if (allowGuest) {

      yield await getData<T, R>(
        path: path,
        deserializer: deserializer,
        params: params,
        callBack: (R data) async {
          await localData.storeData(data);
          await callback?.call(data);
        },
      );
    }

    if (cache == null && !allowGuest) {
      yield ApiResponse.success(null);
    }
  }


  /// Helpers
  ApiResponse<R> _getServerError<R>(Object e) {
    printColored("_getServerError $e");
    final error = e as ServerError;
    final ApiResponse<R> apiResponse = ApiResponse.failure(
      code: error.code ?? "-1",
      message: ServerErrorType.fromCode(error.code ?? "-1").message(),
    );
    if (kDebugMode) {
      printColored("api response is $apiResponse");
    }
    return apiResponse;
  }
}
