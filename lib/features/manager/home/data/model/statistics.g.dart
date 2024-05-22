// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticsModelImpl _$$StatisticsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatisticsModelImpl(
      id: (json['id'] as num).toInt(),
      color: (json['color'] as num).toInt(),
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$StatisticsModelImplToJson(
        _$StatisticsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'icon': instance.icon,
    };
