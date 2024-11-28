
import 'package:json_annotation/json_annotation.dart';

part 'list_games_params.g.dart';

@JsonSerializable()
class ListGamesParams {

    final int? page;
    final int? pageSize;
    final String? search;
    final String? parentPlatform;
    final String? platforms;
    final String? stores;
    final String? developers;
    final String? publishers;
    final String? genres;
    final String? tags;
    final String? creators;
    final String? dates;
    final int? platformsCount;
    final int? excludeCollection;
    final bool? excludeAdditions;
    final bool? excludeParents;
    final bool? excludeGameSeries;
    final String? ordering;

    ListGamesParams({
      this.page,
      this.pageSize,
      this.search,
      this.parentPlatform,
      this.platforms,
      this.stores,
      this.developers,
      this.publishers,
      this.genres,
      this.tags,
      this.creators,
      this.dates,
      this.platformsCount,
      this.excludeCollection,
      this.excludeAdditions,
      this.excludeParents,
      this.excludeGameSeries,
      this.ordering,
    });

    factory ListGamesParams.fromJson(Map<String, dynamic> json) => _$ListGamesParamsFromJson(json);
    Map<String, dynamic> toJson() => _$ListGamesParamsToJson(this);

}