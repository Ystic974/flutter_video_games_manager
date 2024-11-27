// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_screenshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortScreenshot _$ShortScreenshotFromJson(Map<String, dynamic> json) =>
    ShortScreenshot(
      yet: (json['yet'] as num).toInt(),
      owned: (json['owned'] as num).toInt(),
      beaten: (json['beaten'] as num).toInt(),
      toplay: (json['toplay'] as num).toInt(),
      dropped: (json['dropped'] as num).toInt(),
      playing: (json['playing'] as num).toInt(),
    );

Map<String, dynamic> _$ShortScreenshotToJson(ShortScreenshot instance) =>
    <String, dynamic>{
      'yet': instance.yet,
      'owned': instance.owned,
      'beaten': instance.beaten,
      'toplay': instance.toplay,
      'dropped': instance.dropped,
      'playing': instance.playing,
    };
