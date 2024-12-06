import 'package:json_annotation/json_annotation.dart';

part 'developer.g.dart';

@JsonSerializable()
class Developer {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'games_count')
  final int? gameCount;
  @JsonKey(name: 'image_background')
  final String? imageBackgroundURL;
  final String? description;


  Developer({
    required this.id,
    required this.name,
    required this.slug,
    required this.gameCount,
    required this.imageBackgroundURL,
    required this.description,
  });

  factory Developer.fromJson(Map<String, dynamic> json) => _$DeveloperFromJson(json);
  Map<String, dynamic> toJson() => _$DeveloperToJson(this);
}
