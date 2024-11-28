// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_games_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListGamesParams _$ListGamesParamsFromJson(Map<String, dynamic> json) =>
    ListGamesParams(
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      search: json['search'] as String?,
      parentPlatform: json['parentPlatform'] as String?,
      platforms: json['platforms'] as String?,
      stores: json['stores'] as String?,
      developers: json['developers'] as String?,
      publishers: json['publishers'] as String?,
      genres: json['genres'] as String?,
      tags: json['tags'] as String?,
      creators: json['creators'] as String?,
      dates: json['dates'] as String?,
      platformsCount: (json['platformsCount'] as num?)?.toInt(),
      excludeCollection: (json['excludeCollection'] as num?)?.toInt(),
      excludeAdditions: json['excludeAdditions'] as bool?,
      excludeParents: json['excludeParents'] as bool?,
      excludeGameSeries: json['excludeGameSeries'] as bool?,
      ordering: json['ordering'] as String?,
    );

Map<String, dynamic> _$ListGamesParamsToJson(ListGamesParams instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'search': instance.search,
      'parentPlatform': instance.parentPlatform,
      'platforms': instance.platforms,
      'stores': instance.stores,
      'developers': instance.developers,
      'publishers': instance.publishers,
      'genres': instance.genres,
      'tags': instance.tags,
      'creators': instance.creators,
      'dates': instance.dates,
      'platformsCount': instance.platformsCount,
      'excludeCollection': instance.excludeCollection,
      'excludeAdditions': instance.excludeAdditions,
      'excludeParents': instance.excludeParents,
      'excludeGameSeries': instance.excludeGameSeries,
      'ordering': instance.ordering,
    };
