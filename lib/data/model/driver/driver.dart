import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver.freezed.dart';
part 'driver.g.dart';

@freezed
abstract class Driver with _$Driver {
  const Driver._();

  factory Driver({
    @JsonKey(name: 'driver_id') required String driverId,
    required String name,
    required String phone,
    @JsonKey(name: 'vehicle_type') required String vehicleType,
    @JsonKey(name: 'availability_status') @Default(true) bool availabilityStatus,
  }) = _Driver;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
}

