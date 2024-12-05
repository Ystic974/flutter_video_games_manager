import 'dart:async';

import 'package:injectable/injectable.dart';

import '../api/api_service.dart';
import '../api/model/games.dart';
import '../api/model/genre.dart';
import '../api/model/tag.dart';
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
                page: page,
                pageSize: pageSize,
                search: search,
                parentPlatform: parentPlatform,
                platforms: platforms,
                stores: stores,
                developers: developers,
                publishers: publishers,
                genres: genres,
                tags: tags,
                creators: creators,
                dates: dates,
                platformsCount: platformsCount,
                excludeCollection: excludeCollection,
                excludeAdditions: excludeAdditions,
                excludeParents: excludeParents,
                excludeGameSeries: excludeGameSeries,
                ordering: ordering,
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

    Future<Game> getHightlightGame() async {
        final from = DateTime.now().subtract(const Duration(days: 30)).toString().split(' ').first;
        final to = DateTime.now().toString().split(' ').first;
        final date = "$from,$to";
        try {
            final result = await _apiService.getListOfGames(
                page: 1,
                pageSize: 1,
                ordering: "-popularity" ,
                dates: date
            );
            return result.results.first;
        } catch (e) {
            throw AsyncError(e, StackTrace.empty);
        }
    }
}
