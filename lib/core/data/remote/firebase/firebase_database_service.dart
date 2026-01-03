import 'package:firebase_database/firebase_database.dart';
import 'package:foody/common_imports.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';

/// Service for interacting with Firebase Realtime Database
/// 
/// This service provides CRUD operations for Firebase Realtime Database
/// and handles common database operations like reading, writing, updating, and deleting data.
class FirebaseDatabaseService {
  final DatabaseReference _database;

  /// Creates a FirebaseDatabaseService instance
  /// 
  /// If [database] is provided, it will be used. Otherwise, a default
  /// FirebaseDatabase instance will be used.
  FirebaseDatabaseService({DatabaseReference? database})
      : _database = database ?? FirebaseDatabase.instance.ref();

  /// Get a reference to a specific path in the database
  DatabaseReference ref(String path) {
    return _database.child(path);
  }

  /// Read data from a specific path
  /// 
  /// Returns the data at the given [path] as a Map or null if the path doesn't exist.
  /// 
  /// Example:
  /// ```dart
  /// final data = await service.read('users/user123');
  /// ```
  Future<ApiResponse<Map<String, dynamic>?>> read(String path) async {
    try {
      final snapshot = await ref(path).get();
      
      if (!snapshot.exists) {
        return ApiResponse.success(null);
      }

      final data = snapshot.value as Map<Object?, Object?>?;
      if (data == null) {
        return ApiResponse.success(null);
      }

      // Convert Object? keys to String keys
      final Map<String, dynamic> result = {};
      data.forEach((key, value) {
        result[key.toString()] = value;
      });

      return ApiResponse.success(result);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to read data: ${e.toString()}',
      );
    }
  }

  /// Read a list of data from a specific path
  /// 
  /// Returns a list of maps from the given [path].
  /// 
  /// Example:
  /// ```dart
  /// final restaurants = await service.readList('restaurants');
  /// ```
  Future<ApiResponse<List<Map<String, dynamic>>>> readList(String path) async {
    try {
      final snapshot = await ref(path).get();
      
      if (!snapshot.exists) {
        return ApiResponse.success([]);
      }

      final data = snapshot.value;
      if (data == null) {
        return ApiResponse.success([]);
      }

      if (data is Map) {
        // Convert map to list of maps
        final List<Map<String, dynamic>> result = [];
        data.forEach((key, value) {
          if (value is Map) {
            final Map<String, dynamic> item = {};
            value.forEach((k, v) {
              item[k.toString()] = v;
            });
            result.add(item);
          }
        });
        return ApiResponse.success(result);
      } else if (data is List) {
        // Already a list
        final List<Map<String, dynamic>> result = [];
        for (var item in data) {
          if (item is Map) {
            final Map<String, dynamic> mapItem = {};
            item.forEach((k, v) {
              mapItem[k.toString()] = v;
            });
            result.add(mapItem);
          }
        }
        return ApiResponse.success(result);
      }

      return ApiResponse.success([]);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to read list: ${e.toString()}',
      );
    }
  }

  /// Write data to a specific path
  /// 
  /// Writes [data] to the given [path]. If the path already exists, it will be overwritten.
  /// 
  /// Example:
  /// ```dart
  /// await service.write('users/user123', {'name': 'John', 'email': 'john@example.com'});
  /// ```
  Future<ApiResponse<void>> write(
    String path,
    Map<String, dynamic> data,
  ) async {
    try {
      await ref(path).set(data);
      return ApiResponse.success(null);
    } catch (e) {
      printColored("Failed to write data $e");
      return ApiResponse.failure(
        message: 'Failed to write data: ${e.toString()}',
      );
    }
  }

  /// Update data at a specific path
  /// 
  /// Updates only the specified fields in [data] at the given [path].
  /// Other fields remain unchanged.
  /// 
  /// Example:
  /// ```dart
  /// await service.update('users/user123', {'name': 'Jane'});
  /// ```
  Future<ApiResponse<void>> update(
    String path,
    Map<String, dynamic> data,
  ) async {
    try {
      await ref(path).update(data);
      return ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to update data: ${e.toString()}',
      );
    }
  }

  /// Delete data at a specific path
  /// 
  /// Removes the data at the given [path].
  /// 
  /// Example:
  /// ```dart
  /// await service.delete('users/user123');
  /// ```
  Future<ApiResponse<void>> delete(String path) async {
    try {
      await ref(path).remove();
      return ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to delete data: ${e.toString()}',
      );
    }
  }

  /// Push data to a list (auto-generates a unique key)
  /// 
  /// Adds [data] to a list at the given [path] with an auto-generated key.
  /// Returns the generated key.
  /// 
  /// Example:
  /// ```dart
  /// final key = await service.push('orders', {'status': 'pending'});
  /// ```
  Future<ApiResponse<String>> push(
    String path,
    Map<String, dynamic> data,
  ) async {
    try {
      final newRef = ref(path).push();
      await newRef.set(data);
      return ApiResponse.success(newRef.key ?? '');
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to push data: ${e.toString()}',
      );
    }
  }

  /// Listen to real-time changes at a specific path
  /// 
  /// Returns a stream that emits updates whenever data at [path] changes.
  /// 
  /// Example:
  /// ```dart
  /// service.listen('orders/order123').listen((data) {
  ///   print('Order updated: $data');
  /// });
  /// ```
  Stream<Map<String, dynamic>?> listen(String path) {
    return ref(path).onValue.map((event) {
      if (!event.snapshot.exists) {
        return null;
      }

      final data = event.snapshot.value as Map<Object?, Object?>?;
      if (data == null) {
        return null;
      }

      final Map<String, dynamic> result = {};
      data.forEach((key, value) {
        result[key.toString()] = value;
      });

      return result;
    });
  }

  /// Listen to real-time changes for a list at a specific path
  /// 
  /// Returns a stream that emits a list of maps whenever data at [path] changes.
  /// 
  /// Example:
  /// ```dart
  /// service.listenList('orders').listen((orders) {
  ///   print('Orders updated: ${orders.length}');
  /// });
  /// ```
  Stream<List<Map<String, dynamic>>> listenList(String path) {
    return ref(path).onValue.map((event) {
      if (!event.snapshot.exists) {
        return <Map<String, dynamic>>[];
      }

      final data = event.snapshot.value;
      if (data == null) {
        return <Map<String, dynamic>>[];
      }

      if (data is Map) {
        final List<Map<String, dynamic>> result = [];
        data.forEach((key, value) {
          if (value is Map) {
            final Map<String, dynamic> item = {};
            value.forEach((k, v) {
              item[k.toString()] = v;
            });
            result.add(item);
          }
        });
        return result;
      }

      return <Map<String, dynamic>>[];
    });
  }

  /// Check if a path exists in the database
  /// 
  /// Returns true if data exists at the given [path], false otherwise.
  /// 
  /// Example:
  /// ```dart
  /// final exists = await service.exists('users/user123');
  /// ```
  Future<ApiResponse<bool>> exists(String path) async {
    try {
      final snapshot = await ref(path).get();
      return ApiResponse.success(snapshot.exists);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to check existence: ${e.toString()}',
      );
    }
  }

  /// Set a value with a priority
  /// 
  /// Sets [data] at [path] with the specified [priority] for ordering.
  /// 
  /// Example:
  /// ```dart
  /// await service.setWithPriority('orders', {'status': 'pending'}, 100);
  /// ```
  Future<ApiResponse<void>> setWithPriority(
    String path,
    Map<String, dynamic> data,
    dynamic priority,
  ) async {
    try {
      await ref(path).set(data).then((_) {
        ref(path).setPriority(priority);
      });
      return ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to set with priority: ${e.toString()}',
      );
    }
  }

  /// Query data with ordering and limiting
  /// 
  /// Queries data at [path] with optional [orderBy], [limit], and [startAt]/[endAt] filters.
  /// 
  /// Example:
  /// ```dart
  /// final results = await service.query(
  ///   'orders',
  ///   orderBy: 'createdAt',
  ///   limit: 10,
  /// );
  /// ```
  Future<ApiResponse<List<Map<String, dynamic>>>> query(
    String path, {
    String? orderBy,
    int? limit,
    dynamic startAt,
    dynamic endAt,
    dynamic equalTo,
  }) async {
    try {
      Query query = ref(path);

      if (orderBy != null) {
        query = query.orderByChild(orderBy);
      }

      if (startAt != null) {
        query = query.startAt(startAt);
      }

      if (endAt != null) {
        query = query.endAt(endAt);
      }

      if (equalTo != null) {
        query = query.equalTo(equalTo);
      }

      if (limit != null) {
        query = query.limitToFirst(limit);
      }

      final snapshot = await query.get();

      if (!snapshot.exists) {
        return ApiResponse.success([]);
      }

      final data = snapshot.value as Map<Object?, Object?>?;
      if (data == null) {
        return ApiResponse.success([]);
      }

      final List<Map<String, dynamic>> result = [];
      data.forEach((key, value) {
        if (value is Map) {
          final Map<String, dynamic> item = {};
          value.forEach((k, v) {
            item[k.toString()] = v;
          });
          result.add(item);
        }
      });

      return ApiResponse.success(result);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to query data: ${e.toString()}',
      );
    }
  }
}

