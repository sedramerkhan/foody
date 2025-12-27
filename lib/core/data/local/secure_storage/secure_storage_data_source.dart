import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageDataSource {
  static final SecureStorageDataSource _instance = SecureStorageDataSource._internal();
  factory SecureStorageDataSource() => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  SecureStorageDataSource._internal();

  /// Write a value
  Future<void> write(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read a value
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete a value
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Read all values
  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }

  /// Delete all values
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
