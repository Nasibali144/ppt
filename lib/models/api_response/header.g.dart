// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Header _$$_HeaderFromJson(Map<String, dynamic> json) => _$_Header(
      code: json['code'] as int,
      success: json['success'] as bool,
      timestamp: json['timestamp'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_HeaderToJson(_$_Header instance) => <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'timestamp': instance.timestamp,
      'message': instance.message,
    };
