import 'package:json_annotation/json_annotation.dart';

part 'publisher.g.dart';

@JsonSerializable()
class Publisher {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'games_count')
  final int? gameCount;
  @JsonKey(name: 'image_background')
  final String? imageBackgroundURL;
  final String? description;

  Publisher({
    required this.id,
    required this.name,
    required this.slug,
    required this.gameCount,
    required this.imageBackgroundURL,
    required this.description,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) => _$PublisherFromJson(json);
  Map<String, dynamic> toJson() => _$PublisherToJson(this);
}
