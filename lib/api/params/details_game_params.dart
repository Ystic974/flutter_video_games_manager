
import 'package:json_annotation/json_annotation.dart';

part 'details_game_params.g.dart';

@JsonSerializable()
class DetailsGameParams {

  final int id;

  DetailsGameParams({ required this.id });

  factory DetailsGameParams.fromJson(Map<String, dynamic> json) => _$DetailsGameParamsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsGameParamsToJson(this);

}