// Global instance of GetIt
import 'package:foody/common_imports.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// Helper function to register lazy singletons
void _registerLazySingletonHelper<T extends Object>(T Function() creator) {
  getIt.registerLazySingleton<T>(creator);
}

void registerSingleton() {
  _registerLazySingletonHelper<ApiClient>(() => ApiClient());
}
