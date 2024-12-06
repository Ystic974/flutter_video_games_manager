import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:video_games_manager_flutter/utils/color_extractor.dart';

import 'game_repository.dart';
import 'game_state.dart';

final gameNotifierProvider =
StateNotifierProvider<GameNotifier, GameState>((ref) {
  return GetIt.I.get<GameNotifier>();
});


@injectable
class GameNotifier extends StateNotifier<GameState> {

  final GameRepository _gameRepository;

  static const String tag1 = "123";   //"41509" big tits
  static const tag2 = "569"; //"50"
  static const genre1 = "5"; //"4"

  final String tag1Detail = "";
  final String tag2Detail = "";
  final String genre1Detail = "";

  GameNotifier(this._gameRepository) : super(const GameState.initial()) { }

  Future<void> getGames(int index) async {
    final from = DateTime.now().subtract(const Duration(days: 90)).toString().split(' ').first;
    final to = DateTime.now().toString().split(' ').first;

    final games = await _gameRepository.getGames(page: (index / 10 + 1).toInt(), pageSize: 10, dates: "$from,$to");
    state = state.gotGames(games.results);
  }

  void getGameDetails(int id) async{
    final singleGame = await _gameRepository.getGameDetails(id);
    state = state.gotGameSingle(singleGame);
  }

  void getGamesByTag(int index, String tag) async {
    if (index == 0) state = state.setLoading(true);

    final games = await _gameRepository.getGames(page: (index / 10 + 1).toInt(), pageSize: 10, tags: tag);
    switch(index) {
      case 1:
        state = state.gotGames2(games.results);
        break;
      case 2:
        state = state.gotGames3(games.results);
        break;
    }
  }

  void getTagDetails(int tag, int id) async {
    final tagRes = await _gameRepository.getTagDetails(id);
    switch(tag) {
      case 1:
        state = state.setTag1(tagRes.name);
        break;
      case 2:
        state = state.setTag2(tagRes.name);
        break;
    }
  }

  void getGenreDetails(int id) async {
    final tagRes = await _gameRepository.getGenreDetails(id);
    state = state.setGenre(tagRes.name);
  }

  void getHighlightedGame() async {
    final game = await _gameRepository.getHightlightGame();
    getHighlightedGameColors(await extractColorFromImage(game.backgroundImage!));
    state = state.gotHightlightGame(game);
  }

  void getHighlightedGameColors(Triple<Color, Color, Color> colors) async {
    state = state.setColors(colors.first, colors.second, colors.third);
  }

}