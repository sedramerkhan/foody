// Global instance of GetIt
import 'package:foody/common_imports.dart';
import 'package:foody/data/repo/menu_repo.dart';
import 'package:foody/data/repo/restaurant_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// Helper function to register lazy singletons
void _registerLazySingletonHelper<T extends Object>(T Function() creator) {
  getIt.registerLazySingleton<T>(creator);
}

void registerSingleton() {
  _registerLazySingletonHelper<ApiClient>(() => ApiClient());
  _registerLazySingletonHelper<FirebaseDatabaseService>(
        () => FirebaseDatabaseService(),
  );
  _registerLazySingletonHelper<FirebaseAuthService>(
        () => FirebaseAuthService(),
  );


  _registerLazySingletonHelper<AppLocalData>(()=> AppLocalData());

  // Repositories
  _registerLazySingletonHelper<OrderRepo>(() => OrderRepo());
  _registerLazySingletonHelper<OrderItemRepo>(() => OrderItemRepo());
  _registerLazySingletonHelper<PaymentRepo>(() => PaymentRepo());
  _registerLazySingletonHelper<DeliveryRepo>(() => DeliveryRepo());
  _registerLazySingletonHelper<DriverRepo>(() => DriverRepo());
  _registerLazySingletonHelper<CartRepo>(() => CartRepo());
  _registerLazySingletonHelper<RestaurantRepo>(() => RestaurantRepo());
  _registerLazySingletonHelper<MenuRepo>(() => MenuRepo());
}
