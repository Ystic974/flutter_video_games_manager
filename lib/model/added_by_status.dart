import 'package:json_annotation/json_annotation.dart';

part 'added_by_status.g.dart';

@JsonSerializable()
class AddedByStatus {
  final int id;
  final String title;
  final int count;
  final double percent;

  AddedByStatus({
    required this.id,
    required this.title,
    required this.count,
    required this.percent,
  });

  factory AddedByStatus.formJson(Map<String, dynamic> json) => _$AddedByStatusFromJson(json);
  Map<String, dynamic> toJson() => _$AddedByStatusToJson(this);

}