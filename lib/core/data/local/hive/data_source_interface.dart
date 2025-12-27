abstract class DataSourceInterface {
  /// Initialize DataSource
  Future<void> initialize(String sourceName);

  /// Set value of T type.
  Future<void> set<T>({required String key, required T value});

  /// Get value of T type.
  Future<T?> get<T>({required String key, T? defaultValue});

  /// Delete value of T type.
  Future<void> delete({required String key});

  /// Clear value
  Future<void> clear();
}
