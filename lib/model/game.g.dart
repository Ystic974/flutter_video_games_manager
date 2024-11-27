// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      id: (json['gameId'] as num).toInt(),
      slug: json['slug'] as String,
      name: json['name'] as String,
      released: json['released'] as String?,
      tba: json['tba'] as bool?,
      backgroundImage: json['backgroundImage'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingTop: (json['ratingTop'] as num?)?.toInt(),
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingsCount: (json['ratingsCount'] as num?)?.toInt(),
      reviewsTextCount: json['reviewsTextCount'] as String?,
      added: (json['added'] as num?)?.toInt(),
      addedByStatus: json['addedByStatus'] == null
          ? null
          : AddedByStatus.fromJson(
              json['addedByStatus'] as Map<String, dynamic>),
      metacritic: (json['metacritic'] as num?)?.toInt(),
      playtime: (json['playtime'] as num?)?.toInt(),
      suggestionsCount: (json['suggestionsCount'] as num?)?.toInt(),
      shortScreenshots: (json['shortScreenshots'] as List<dynamic>?)
          ?.map((e) => ShortScreenshot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'gameId': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'released': instance.released,
      'tba': instance.tba,
      'backgroundImage': instance.backgroundImage,
      'rating': instance.rating,
      'ratingTop': instance.ratingTop,
      'ratings': instance.ratings,
      'ratingsCount': instance.ratingsCount,
      'reviewsTextCount': instance.reviewsTextCount,
      'added': instance.added,
      'addedByStatus': instance.addedByStatus,
      'metacritic': instance.metacritic,
      'playtime': instance.playtime,
      'suggestionsCount': instance.suggestionsCount,
      'shortScreenshots': instance.shortScreenshots,
    };
