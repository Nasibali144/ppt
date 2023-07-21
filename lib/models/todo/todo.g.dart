// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isComplete: json['isComplete'] as bool,
      title: json['title'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isComplete': instance.isComplete,
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
    };
