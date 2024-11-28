import 'package:json_annotation/json_annotation.dart';

part 'platforms.g.dart';

@JsonSerializable()
class Platform {
  final int id;
  final String slug;
  final String name;

  Platform({
    required this.id,
    required this.slug,
    required this.name,
  });

  factory Platform.fromJson(Map<String, dynamic> json) => _$PlatformFromJson(json);
  Map<String, dynamic> toJson() => _$PlatformToJson(this);
}



@JsonSerializable()
class PlatformParentSingle {
  final Platform platform;
  @JsonKey(name: 'release_at')
  final String releaseAt;
  final Requirement requirements;

  PlatformParentSingle({
    required this.platform,
    required this.releaseAt,
    required this.requirements,
  });

  factory PlatformParentSingle.fromJson(Map<String, dynamic> json) => _$PlatformParentSingleFromJson(json);
  Map<String, dynamic> toJson() => _$PlatformParentSingleToJson(this);
}



@JsonSerializable()
class Requirement {
  final String minimum;
  final String recommended;

  Requirement({
    required this.minimum,
    required this.recommended,
  });

  factory Requirement.fromJson(Map<String, dynamic> json) => _$RequirementFromJson(json);
  Map<String, dynamic> toJson() => _$RequirementToJson(this);
}

