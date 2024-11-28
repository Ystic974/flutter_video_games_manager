// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      gamesCount: (json['games_count'] as num).toInt(),
      imageBackgroundURL: json['image_background_url'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'games_count': instance.gamesCount,
      'image_background_url': instance.imageBackgroundURL,
      'description': instance.description,
    };
