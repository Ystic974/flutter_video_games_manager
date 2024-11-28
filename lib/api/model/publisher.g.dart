// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Publisher _$PublisherFromJson(Map<String, dynamic> json) => Publisher(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      gameCount: (json['game_count'] as num).toInt(),
      imageBackgroundURL: json['image_background_url'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PublisherToJson(Publisher instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'game_count': instance.gameCount,
      'image_background_url': instance.imageBackgroundURL,
      'description': instance.description,
    };
