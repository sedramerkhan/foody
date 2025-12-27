import 'package:hive_ce/hive.dart';

import 'data_source_interface.dart';

class HiveDataSource implements DataSourceInterface {
  late Box currentBox;

  @override
  Future<void> initialize(String sourceName) async {
    currentBox = await Hive.openBox(sourceName);
  }

  @override
  Future<void> set<T>({required String key, required T value}) async {
    await currentBox.put(key, value);
  }

  @override
  Future<T?> get<T>({required String key, T? defaultValue}) async {
    return await currentBox.get(key, defaultValue: defaultValue);
  }

  @override
  Future<void> delete({required String key}) async {
    await currentBox.delete(key);
  }

  @override
  Future<void> clear() async {
    await currentBox.clear();
  }

  /// Clear Data
  static Future<void> clearBox(String boxName) async {
    final dataSource = HiveDataSource();
    await dataSource.initialize(boxName);
    await dataSource.clear();
  }
}
