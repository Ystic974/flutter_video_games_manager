// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Developer _$DeveloperFromJson(Map<String, dynamic> json) => Developer(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      gameCount: (json['game_count'] as num).toInt(),
      imageBackgroundURL: json['image_background_url'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$DeveloperToJson(Developer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'game_count': instance.gameCount,
      'image_background_url': instance.imageBackgroundURL,
      'description': instance.description,
    };
