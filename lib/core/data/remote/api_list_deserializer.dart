import 'package:flutter/foundation.dart';

/// This class decodes list responses by deserializing each item using the provided model.
class ApiListDeserializer<T> {
  /// Decodes a list of dynamic JSON objects into a list of typed objects.
  ///
  /// Returns an empty list if any error occurs during deserialization.
  List<T> decodeList(
    List<dynamic> jsonList,
    T Function(Map<String, dynamic> json) deserializer,
  ) {
    try {
      return jsonList
          .map((json) => deserializer(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error in ApiListDeserializer: $e');
      }
      return [];
    }
  }
}
