// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rawg_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawgData<T> _$RawgDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    RawgData<T>(
      results: fromJsonT(json['results']),
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$RawgDataToJson<T>(
  RawgData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': toJsonT(instance.results),
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
    };
