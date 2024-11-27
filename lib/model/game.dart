import 'package:json_annotation/json_annotation.dart';
import 'package:video_games_manager_flutter/model/rating.dart';
import 'package:video_games_manager_flutter/model/short_screenshot.dart';
import 'package:video_games_manager_flutter/model/added_by_status.dart';

part 'game.g.dart';

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