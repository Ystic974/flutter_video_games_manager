// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'added_by_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddedByStatus _$AddedByStatusFromJson(Map<String, dynamic> json) =>
    AddedByStatus(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      count: (json['count'] as num).toInt(),
      percent: (json['percent'] as num).toDouble(),
    );

Map<String, dynamic> _$AddedByStatusToJson(AddedByStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'count': instance.count,
      'percent': instance.percent,
    };
