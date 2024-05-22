// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      priorityId: (json['priorityId'] as num).toInt(),
      endDate: DateTime.parse(json['endDate'] as String),
      progressCount: (json['progressCount'] as num).toInt(),
      departmentTag: json['departmentTag'] as String,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'priorityId': instance.priorityId,
      'endDate': instance.endDate.toIso8601String(),
      'progressCount': instance.progressCount,
      'departmentTag': instance.departmentTag,
    };
