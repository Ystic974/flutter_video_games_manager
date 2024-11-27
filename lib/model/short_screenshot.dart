import 'package:json_annotation/json_annotation.dart';

part 'short_screenshot.g.dart';

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

  factory ShortScreenshot.formJson(Map<String, dynamic> json) => _$ShortScreenshotFromJson(json);
  Map<String, dynamic> toJson() => _$ShortScreenshotToJson(this);

}