
import 'hive_data_source.dart';

class BaseLocalData<T> {
  final String _boxName;
  final String _keyName;

  BaseLocalData({
    required String boxName,
    required String keyName,
  }) : _keyName = keyName, _boxName = boxName;

  /// Store Data
  Future<void> storeData(T? value) async {
    final dataSource = HiveDataSource();
    await dataSource.initialize(_boxName);
    await dataSource.set(
      key: _keyName,
      value: value,
    );
  }

  /// Get Data
  Future<T?> getData() async {
    final dataSource = HiveDataSource();
    await dataSource.initialize(_boxName);
    final T? data = await dataSource.get<T>(
      key: _keyName,
    );
    return data;
  }

  /// Delete Data
  Future<void> deleteData() async {
    final dataSource = HiveDataSource();
    await dataSource.initialize(_boxName);
    await dataSource.delete(
      key: _keyName,
    );
  }
}
