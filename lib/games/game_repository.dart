
import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:video_games_manager_flutter/api/params/list_games_params.dart';

import '../api/api_service.dart';
import '../api/model/games.dart';
import '../api/params/details_game_params.dart';
import '../api/rawg_data.dart';

@injectable
class GameRepository {
    final ApiService _apiService;

    GameRepository(this._apiService);

    Future<RawgData<List<Game>>> getGames({ String? query, int? pageSize}) async {
        try {
            final result = await _apiService.getListOfGames(
                search: query,
                pageSize: pageSize,
            );
            return result;
        } catch (e) {
          throw AsyncError(e, StackTrace.empty);
        }
    }

    Future<GameSingle> getGameDetails(int id) async {
        try {
            final result = await _apiService.getDetailsOfGame(id);
            return result;
        } catch (e) {
            throw AsyncError(e, StackTrace.empty);
        }
    }
}
