import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:video_games_manager_flutter/api/model/games.dart';
import 'package:video_games_manager_flutter/api/params/details_game_params.dart';
import 'package:video_games_manager_flutter/api/params/list_games_params.dart';

import 'game_repository.dart';
import 'game_state.dart';

final gameNotifierProvider =
StateNotifierProvider<GameNotifier, GameState>((ref) {
  return GetIt.I.get<GameNotifier>();
});


@injectable
class GameNotifier extends StateNotifier<GameState> {

  final GameRepository _gameRepository;

  GameNotifier(this._gameRepository) : super(const GameState.initial()) { }

  Future<void> getGames() async {
    final games = await _gameRepository.getGames();
    state = state.gotGames(games.results);
  }

  void getGameDetails(int id) async{
    final singleGame = await _gameRepository.getGameDetails(id);
    state = state.gotGameDetails(singleGame);

  }

}