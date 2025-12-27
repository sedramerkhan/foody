import 'package:foody/core/data/local/secure_storage/secure_storage_data_source.dart';

class BaseSecureLocalData {
  final String _key;

  final storage = SecureStorageDataSource();

  BaseSecureLocalData({
    required String key,
  }) : _key = key;

  /// Store Data
  Future<void> storeData(String? value) async {
    await storage.write(
      _key,
      value,
    );
  }

  /// Get Data
  Future<String?> getData() async {
    return await storage.read(_key);
  }

  /// Delete Data
  Future<void> deleteData() async {
    await storage.delete(_key);
  }
}
