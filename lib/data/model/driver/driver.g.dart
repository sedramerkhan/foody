// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Driver _$DriverFromJson(Map<String, dynamic> json) => _Driver(
  driverId: json['driver_id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  vehicleType: json['vehicle_type'] as String,
  availabilityStatus: json['availability_status'] as bool? ?? true,
);

Map<String, dynamic> _$DriverToJson(_Driver instance) => <String, dynamic>{
  'driver_id': instance.driverId,
  'name': instance.name,
  'phone': instance.phone,
  'vehicle_type': instance.vehicleType,
  'availability_status': instance.availabilityStatus,
};
