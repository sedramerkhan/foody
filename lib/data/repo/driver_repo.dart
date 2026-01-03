import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/driver/driver.dart';

/// Repository for driver operations
class DriverRepo extends BaseRepository {
  final FirebaseDatabaseService _databaseService = getIt<FirebaseDatabaseService>();

  /// Create a driver in Firebase
  Future<ApiResponse<String>> createDriver(Driver driver) async {
    final driverData = driver.toJson();
    final path = 'drivers/${driver.driverId}';
    
    final response = await _databaseService.write(path, driverData);
    
    if (response.isFailure) {
      return response.mapData((_) => '');
    }
    
    return ApiResponse.success(driver.driverId);
  }

  /// Get all available drivers
  Future<ApiResponse<List<Driver>>> getAvailableDrivers() async {
    try {
      final response = await _databaseService.readList('drivers');
      
      if (response.isFailure) {
        return response.mapData((_) => <Driver>[]);
      }

      final driversList = response.getDataOrNull() ?? [];
      
      try {
        final drivers = driversList
            .where((json) => json is Map<String, dynamic> && json['availability_status'] == true)
            .map((json) => Driver.fromJson(json as Map<String, dynamic>))
            .toList();
        
        return ApiResponse.success(drivers);
      } catch (e) {
        return ApiResponse.failure(
          message: 'Failed to parse drivers: ${e.toString()}',
        );
      }
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to fetch drivers: ${e.toString()}',
      );
    }
  }

  /// Get a single driver by ID
  Future<ApiResponse<Driver>> getDriver(String driverId) async {
    final response = await _databaseService.read('drivers/$driverId');
    
    if (response.isFailure) {
      return response.mapData((_) => throw Exception('Driver not found'));
    }

    final driverData = response.getDataOrNull();
    if (driverData == null) {
      return ApiResponse.failure(message: 'Driver not found');
    }

    try {
      final driver = Driver.fromJson(driverData);
      return ApiResponse.success(driver);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to parse driver: ${e.toString()}',
      );
    }
  }

  /// Add multiple drivers to Firebase
  Future<ApiResponse<void>> addDrivers(List<Driver> drivers) async {
    try {
      for (final driver in drivers) {
        final response = await createDriver(driver);
        if (response.isFailure) {
          final failure = response as Failure;
          return ApiResponse.failure(
            message: 'Failed to add driver ${driver.name}: ${failure.message}',
          );
        }
      }
      return const ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to add drivers: ${e.toString()}',
      );
    }
  }

  /// Generate fake drivers for testing
  static List<Driver> getFakeDrivers() {
    return [
      Driver(
        driverId: 'driver_1',
        name: 'Ahmad Al-Mahmoud',
        phone: '+963 11 111 1111',
        vehicleType: 'Motorcycle',
        availabilityStatus: true,
      ),
      Driver(
        driverId: 'driver_2',
        name: 'Mohammed Al-Hassan',
        phone: '+963 11 222 2222',
        vehicleType: 'Car',
        availabilityStatus: true,
      ),
      Driver(
        driverId: 'driver_3',
        name: 'Omar Al-Khalil',
        phone: '+963 11 333 3333',
        vehicleType: 'Motorcycle',
        availabilityStatus: true,
      ),
      Driver(
        driverId: 'driver_4',
        name: 'Khalid Al-Dimashqi',
        phone: '+963 11 444 4444',
        vehicleType: 'Car',
        availabilityStatus: true,
      ),
      Driver(
        driverId: 'driver_5',
        name: 'Youssef Al-Aleppo',
        phone: '+963 21 555 5555',
        vehicleType: 'Motorcycle',
        availabilityStatus: true,
      ),
    ];
  }
}

