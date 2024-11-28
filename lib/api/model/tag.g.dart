// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      gameCount: (json['game_count'] as num).toInt(),
      imageBackgroundURL: json['image_background_url'] as String,
      language: json['language'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'game_count': instance.gameCount,
      'image_background_url': instance.imageBackgroundURL,
      'language': instance.language,
      'description': instance.description,
    };
