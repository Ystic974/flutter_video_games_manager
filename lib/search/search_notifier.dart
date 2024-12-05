import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:video_games_manager_flutter/api/params/list_games_params.dart';
import 'package:video_games_manager_flutter/search/search_state.dart';
import '../games/game_repository.dart';


final searchNotifierProvider =
StateNotifierProvider<GameNotifier, SearchState>((ref) {
  return GetIt.I.get<GameNotifier>();
});


@injectable
class GameNotifier extends StateNotifier<SearchState> {

  final GameRepository _gameRepository;

  GameNotifier(this._gameRepository) : super(const SearchState.initial()) { }

  Future<void> searchGames(String query) async {
    final games = await _gameRepository.getGames(
        search: query,
        pageSize: 8,
    );
    state = state.gotSearchResults(games.results);
  }

  void emptySearchGames() {
    state = state.gotSearchResults([]);
  }



}