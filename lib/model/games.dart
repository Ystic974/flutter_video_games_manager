import 'package:json_annotation/json_annotation.dart';

part 'games.g.dart';

@JsonSerializable()
class Game {
    @JsonKey(name: "gameId") final int id;
    final String slug;
    final String name;
    final String? released;
    final bool? tba;
    final String? backgroundImage;
    final double? rating;
    final int? ratingTop;
    final List<Rating>? ratings;
    final int? ratingsCount;
    final String? reviewsTextCount;
    final int? added;
    final AddedByStatus? addedByStatus;
    final int? metacritic;
    final int? playtime;
    final int? suggestionsCount;
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

    factory Game.fromJson(Map<String, dynamic?> json) => _$GameFromJson(json);
    Map<String, dynamic> toJson() => _$GameToJson(this);
}

@JsonSerializable()
class Rating {
    final int id;
    final String title;
    final int count;
    final double percent;

    Rating({
        required this.id,
        required this.title,
        required this.count,
        required this.percent,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
    Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class AddedByStatus {
    final int id;
    final String title;
    final int count;
    final double percent;

    AddedByStatus({
        required this.id,
        required this.title,
        required this.count,
        required this.percent,
    });

    factory AddedByStatus.fromJson(Map<String, dynamic> json) => _$AddedByStatusFromJson(json);
    Map<String, dynamic> toJson() => _$AddedByStatusToJson(this);

}

@JsonSerializable()
class ShortScreenshot {
    final int yet;
    final int owned;
    final int beaten;
    final int toplay;
    final int dropped;
    final int playing;

    ShortScreenshot({
        required this.yet,
        required this.owned,
        required this.beaten,
        required this.toplay,
        required this.dropped,
        required this.playing,
    });

    factory ShortScreenshot.fromJson(Map<String, dynamic> json) => _$ShortScreenshotFromJson(json);
    Map<String, dynamic> toJson() => _$ShortScreenshotToJson(this);

}