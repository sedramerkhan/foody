// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerError _$ServerErrorFromJson(Map<String, dynamic> json) => _ServerError(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ServerErrorToJson(_ServerError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
