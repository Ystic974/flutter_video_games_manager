import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'game_count')
  final int gameCount;
  @JsonKey(name: 'image_background_url')
  final String imageBackgroundURL;
  final String language;
  final String description;

  Tag({
    required this.id,
    required this.name,
    required this.slug,
    required this.gameCount,
    required this.imageBackgroundURL,
    required this.language,
    required this.description,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);
}
