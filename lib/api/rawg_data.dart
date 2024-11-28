import 'package:json_annotation/json_annotation.dart';

part 'rawg_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class RawgData<T> {
    final T results;
    final int count;
    final String? next;
    final String? previous;

    RawgData({
        required this.results,
        required this.count,
        this.next,
        this.previous,
    });

    factory RawgData.fromJson(
        Map<String, dynamic> json,
        T Function(Object? json) fromJsonT
    ) => _$RawgDataFromJson(json, fromJsonT);

    Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$RawgDataToJson(this, toJsonT);

}
