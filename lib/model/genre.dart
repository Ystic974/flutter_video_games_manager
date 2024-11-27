import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'games_count')
  final int gamesCount;
  @JsonKey(name: 'image_background_url')
  final String imageBackgroundURL;
  final String description;

  Genre({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackgroundURL,
    required this.description,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
