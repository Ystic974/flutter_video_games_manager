// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Developer _$DeveloperFromJson(Map<String, dynamic> json) => Developer(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      gameCount: (json['games_count'] as num?)?.toInt(),
      imageBackgroundURL: json['image_background'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DeveloperToJson(Developer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'games_count': instance.gameCount,
      'image_background': instance.imageBackgroundURL,
      'description': instance.description,
    };
