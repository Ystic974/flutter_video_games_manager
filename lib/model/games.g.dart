// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games.dart';

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

GameSingle _$GameSingleFromJson(Map<String, dynamic> json) => GameSingle(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      name: json['name'] as String,
      nameOriginal: json['name_original'] as String,
      description: json['description'] as String,
      metacritic: (json['metacritic'] as num).toInt(),
      released: json['released'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      publishers: (json['publishers'] as List<dynamic>)
          .map((e) => Publisher.fromJson(e as Map<String, dynamic>))
          .toList(),
      developers: (json['developers'] as List<dynamic>)
          .map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      tba: json['tba'] as bool,
      updated: json['updated'] as String,
      backgroundImageURL: json['background_image'] as String,
      backgroundImageAdditionalURL:
          json['background_image_additional'] as String,
      website: json['website'] as String,
      rating: json['rating'] as num,
      ratingTop: (json['rating_top'] as num).toInt(),
      ratings: (json['ratings'] as List<dynamic>)
          .map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      reactions: json['reactions'] as Map<String, dynamic>,
      added: (json['added'] as num).toInt(),
      addedByStatus: AddedByStatus.fromJson(
          json['added_by_status'] as Map<String, dynamic>),
      playtime: (json['playtime'] as num).toInt(),
      screenshotsCount: (json['screenshots_count'] as num).toInt(),
      moviesCount: (json['movies_count'] as num).toInt(),
      creatorsCount: (json['creators_count'] as num).toInt(),
      achievementsCount: (json['achievements_count'] as num).toInt(),
      parentAchievementsCount:
          (json['parent_achievements_count'] as num).toInt(),
      redditURL: json['reddit_url'] as String,
      redditName: json['reddit_name'] as String,
      redditDescription: json['reddit_description'] as String,
      redditLogoURL: json['reddit_logo'] as String,
      redditCount: (json['reddit_count'] as num).toInt(),
      twitchCount: json['twitch_count'] as String,
      youtubeCount: json['youtube_count'] as String,
      reviewsTextCount: json['reviews_text_count'] as String,
      ratingsCount: (json['ratings_count'] as num).toInt(),
      suggestionsCount: (json['suggestions_count'] as num).toInt(),
      alternativeNames: (json['alternative_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      metacriticURL: json['metacritic_url'] as String,
      parentsCount: (json['parents_count'] as num).toInt(),
      additionsCount: (json['additions_count'] as num).toInt(),
      gameSeriesCount: (json['game_series_count'] as num).toInt(),
      platforms: (json['platforms'] as List<dynamic>)
          .map((e) => PlatformParentSingle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameSingleToJson(GameSingle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'name_original': instance.nameOriginal,
      'description': instance.description,
      'metacritic': instance.metacritic,
      'released': instance.released,
      'genres': instance.genres,
      'tags': instance.tags,
      'publishers': instance.publishers,
      'developers': instance.developers,
      'tba': instance.tba,
      'updated': instance.updated,
      'background_image': instance.backgroundImageURL,
      'background_image_additional': instance.backgroundImageAdditionalURL,
      'website': instance.website,
      'rating': instance.rating,
      'rating_top': instance.ratingTop,
      'ratings': instance.ratings,
      'reactions': instance.reactions,
      'added': instance.added,
      'added_by_status': instance.addedByStatus,
      'playtime': instance.playtime,
      'screenshots_count': instance.screenshotsCount,
      'movies_count': instance.moviesCount,
      'creators_count': instance.creatorsCount,
      'achievements_count': instance.achievementsCount,
      'parent_achievements_count': instance.parentAchievementsCount,
      'reddit_url': instance.redditURL,
      'reddit_name': instance.redditName,
      'reddit_description': instance.redditDescription,
      'reddit_logo': instance.redditLogoURL,
      'reddit_count': instance.redditCount,
      'twitch_count': instance.twitchCount,
      'youtube_count': instance.youtubeCount,
      'reviews_text_count': instance.reviewsTextCount,
      'ratings_count': instance.ratingsCount,
      'suggestions_count': instance.suggestionsCount,
      'alternative_names': instance.alternativeNames,
      'metacritic_url': instance.metacriticURL,
      'parents_count': instance.parentsCount,
      'additions_count': instance.additionsCount,
      'game_series_count': instance.gameSeriesCount,
      'platforms': instance.platforms,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      count: (json['count'] as num).toInt(),
      percent: (json['percent'] as num).toDouble(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'count': instance.count,
      'percent': instance.percent,
    };

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

ShortScreenshot _$ShortScreenshotFromJson(Map<String, dynamic> json) =>
    ShortScreenshot(
      yet: (json['yet'] as num).toInt(),
      owned: (json['owned'] as num).toInt(),
      beaten: (json['beaten'] as num).toInt(),
      toplay: (json['toplay'] as num).toInt(),
      dropped: (json['dropped'] as num).toInt(),
      playing: (json['playing'] as num).toInt(),
    );

Map<String, dynamic> _$ShortScreenshotToJson(ShortScreenshot instance) =>
    <String, dynamic>{
      'yet': instance.yet,
      'owned': instance.owned,
      'beaten': instance.beaten,
      'toplay': instance.toplay,
      'dropped': instance.dropped,
      'playing': instance.playing,
    };
