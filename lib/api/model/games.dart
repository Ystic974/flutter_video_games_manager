import 'package:json_annotation/json_annotation.dart';
import 'package:video_games_manager_flutter/api/model/platforms.dart';
import 'package:video_games_manager_flutter/api/model/publisher.dart';
import 'package:video_games_manager_flutter/api/model/tag.dart';
import 'package:video_games_manager_flutter/api/model/developer.dart';
import 'package:video_games_manager_flutter/api/model/genre.dart';

part 'games.g.dart';

@JsonSerializable()
class Game {
    final int id;
    final String slug;
    final String name;
    final String? released;
    final bool? tba;
    @JsonKey(name: 'background_image')
    final String? backgroundImage;
    final num? rating;
    final int? ratingTop;
    final List<Rating>? ratings;
    final int? ratingsCount;
    final String? reviewsTextCount;
    final int? added;
    final AddedByStatus? addedByStatus;
    final int? metacritic;
    final int? playtime;
    final int? suggestionsCount;
    @JsonKey(name: 'short_screenshots')
    final List<ShortScreenshot>? shortScreenshots;

    Game({
        required this.id,
        required this.slug,
        required this.name,
        this.released,
        this.tba,
        this.backgroundImage,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.ratingsCount,
        this.reviewsTextCount,
        this.added,
        this.addedByStatus,
        this.metacritic,
        this.playtime,
        this.suggestionsCount,
        this.shortScreenshots,
    });

    factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
    Map<String, dynamic> toJson() => _$GameToJson(this);
}

@JsonSerializable()
class GameSingle {
    final int id;
    final String slug;
    final String name;
    @JsonKey(name: 'name_original')
    final String? nameOriginal;
    final String? description;
    final int? metacritic;
    final String? released;
    final List<Genre>? genres;
    final List<Tag>? tags;
    final List<Publisher>? publishers;
    final List<Developer>? developers;
    final bool? tba;
    final String? updated;
    @JsonKey(name: 'background_image')
    final String? backgroundImageURL;
    @JsonKey(name: 'background_image_additional')
    final String? backgroundImageAdditionalURL;
    final String? website;
    final num? rating;
    @JsonKey(name: 'rating_top')
    final int? ratingTop;
    final List<Rating>? ratings;
    final Map<String, dynamic>? reactions; // Assuming a flexible map
    final int? added;
    @JsonKey(name: 'added_by_status')
    final AddedByStatus? addedByStatus;
    final int? playtime;
    @JsonKey(name: 'screenshots_count')
    final int? screenshotsCount;
    @JsonKey(name: 'movies_count')
    final int? moviesCount;
    @JsonKey(name: 'creators_count')
    final int? creatorsCount;
    @JsonKey(name: 'achievements_count')
    final int? achievementsCount;
    @JsonKey(name: 'parent_achievements_count')
    final int? parentAchievementsCount;
    @JsonKey(name: 'reddit_url')
    final String? redditURL;
    @JsonKey(name: 'reddit_name')
    final String? redditName;
    @JsonKey(name: 'reddit_description')
    final String? redditDescription;
    @JsonKey(name: 'reddit_logo')
    final String? redditLogoURL;
    @JsonKey(name: 'reddit_count')
    final int? redditCount;
    @JsonKey(name: 'twitch_count')
    final int? twitchCount;
    @JsonKey(name: 'youtube_count')
    final int? youtubeCount;
    @JsonKey(name: 'reviews_text_count')
    final int? reviewsTextCount;
    @JsonKey(name: 'ratings_count')
    final int? ratingsCount;
    @JsonKey(name: 'suggestions_count')
    final int? suggestionsCount;
    @JsonKey(name: 'alternative_names')
    final List<String?>? alternativeNames;
    @JsonKey(name: 'metacritic_url')
    final String? metacriticURL;
    @JsonKey(name: 'parents_count')
    final int? parentsCount;
    @JsonKey(name: 'additions_count')
    final int? additionsCount;
    @JsonKey(name: 'game_series_count')
    final int? gameSeriesCount;
    final List<PlatformParentSingle>? platforms;

    GameSingle({
        required this.id,
        required this.slug,
        required this.name,
        required this.nameOriginal,
        required this.description,
        required this.metacritic,
        required this.released,
        required this.genres,
        required this.tags,
        required this.publishers,
        required this.developers,
        required this.tba,
        required this.updated,
        required this.backgroundImageURL,
        required this.backgroundImageAdditionalURL,
        required this.website,
        required this.rating,
        required this.ratingTop,
        required this.ratings,
        required this.reactions,
        required this.added,
        required this.addedByStatus,
        required this.playtime,
        required this.screenshotsCount,
        required this.moviesCount,
        required this.creatorsCount,
        required this.achievementsCount,
        required this.parentAchievementsCount,
        required this.redditURL,
        required this.redditName,
        required this.redditDescription,
        required this.redditLogoURL,
        required this.redditCount,
        required this.twitchCount,
        required this.youtubeCount,
        required this.reviewsTextCount,
        required this.ratingsCount,
        required this.suggestionsCount,
        required this.alternativeNames,
        required this.metacriticURL,
        required this.parentsCount,
        required this.additionsCount,
        required this.gameSeriesCount,
        required this.platforms,
    });

    factory GameSingle.fromJson(Map<String, dynamic> json) => _$GameSingleFromJson(json);
    Map<String, dynamic> toJson() => _$GameSingleToJson(this);
}


@JsonSerializable()
class Rating {
    final int id;
    final String? title;
    final int? count;
    final double? percent;

    Rating({
        required this.id,
        this.title,
        this.count,
        this.percent,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
    Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class ShortScreenshot {
    final int id;
    final String? image;

    ShortScreenshot({
        required this.id,
        this.image,
    });

    factory ShortScreenshot.fromJson(Map<String, dynamic> json) => _$ShortScreenshotFromJson(json);
    Map<String, dynamic> toJson() => _$ShortScreenshotToJson(this);

}

@JsonSerializable()
class AddedByStatus {
    final int? yet;
    final int? owned;
    final int? beaten;
    final int? toplay;
    final int? dropped;
    final int? playing;

    AddedByStatus({
        required this.yet,
        required this.owned,
        required this.beaten,
        required this.toplay,
        required this.dropped,
        required this.playing,
    });

    factory AddedByStatus.fromJson(Map<String, dynamic> json) => _$AddedByStatusFromJson(json);
    Map<String, dynamic> toJson() => _$AddedByStatusToJson(this);

}