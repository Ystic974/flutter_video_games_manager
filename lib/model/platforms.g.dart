// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platforms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Platform _$PlatformFromJson(Map<String, dynamic> json) => Platform(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PlatformToJson(Platform instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
    };

PlatformParentSingle _$PlatformParentSingleFromJson(
        Map<String, dynamic> json) =>
    PlatformParentSingle(
      platform: Platform.fromJson(json['platform'] as Map<String, dynamic>),
      releaseAt: json['release_at'] as String,
      requirements:
          Requirement.fromJson(json['requirements'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformParentSingleToJson(
        PlatformParentSingle instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'release_at': instance.releaseAt,
      'requirements': instance.requirements,
    };

Requirement _$RequirementFromJson(Map<String, dynamic> json) => Requirement(
      minimum: json['minimum'] as String,
      recommended: json['recommended'] as String,
    );

Map<String, dynamic> _$RequirementToJson(Requirement instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'recommended': instance.recommended,
    };
