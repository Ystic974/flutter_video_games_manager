import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'games_count')
  final int? gamesCount;
  @JsonKey(name: 'image_background')
  final String? imageBackgroundURL;
  final String? description;

  Tag({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackgroundURL,
    required this.description,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);
}
