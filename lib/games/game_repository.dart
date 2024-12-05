
import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:video_games_manager_flutter/api/params/list_games_params.dart';

import '../api/api_service.dart';
import '../api/model/games.dart';
import '../api/model/genre.dart';
import '../api/model/tag.dart';
import '../api/params/details_game_params.dart';
import '../api/rawg_data.dart';

@injectable
class GameRepository {
    final ApiService _apiService;

    GameRepository(this._apiService);

    Future<RawgData<List<Game>>> getGames({
        int? page,
        int? pageSize,
        String? search,
        String? parentPlatform,
        String? platforms,
        String? stores,
        String? developers,
        String? publishers,
        String? genres,
        String? tags,
        String? creators,
        String? dates,
        int? platformsCount,
        int? excludeCollection,
        bool? excludeAdditions,
        bool? excludeParents,
        bool? excludeGameSeries,
        String? ordering,
    }) async {
        try {
            final result = await _apiService.getListOfGames(
                page,
                pageSize,
                search,
                parentPlatform,
                platforms,
                stores,
                developers,
                publishers,
                genres,
                tags,
                creators,
                dates,
                platformsCount,
                excludeCollection,
                excludeAdditions,
                excludeParents,
                excludeGameSeries,
                ordering,
            );
            return result;
        } catch (e) {
          throw AsyncError(e, StackTrace.empty);
        }
    }

    Future<GameSingle> getGameDetails(DetailsGameParams detailsGameParams) async {
        try {
            final result = null;//await _apiService.getDetailsOfGame(null);
            return result;
        } catch (e) {
            throw AsyncError(e, StackTrace.empty);
        }
    }

    Future<Tag> getTagDetails(int id) async {
        try {
            final result = await _apiService.getTagDetails(id);
            return result;
        } catch (e) {
            throw AsyncError(e, StackTrace.empty);
        }
    }

    Future<Genre> getGenreDetails(int id) async {
        try {
            final result = await _apiService.getGenreDetails(id);
            return result;
        } catch (e) {
            throw AsyncError(e, StackTrace.empty);
        }
    }
}
