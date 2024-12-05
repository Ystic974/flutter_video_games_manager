import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:video_games_manager_flutter/api/rawg_data.dart';
import 'package:video_games_manager_flutter/api/token_interceptor.dart';
import '../env/env.dart';
import 'model/games.dart';
import 'model/genre.dart';
import 'model/tag.dart';

part 'api_service.g.dart';

@singleton
@RestApi()
abstract class ApiService {

  @factoryMethod
  factory ApiService() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.apiUrl,
        contentType: "application/json",
      ),
    );
    dio.interceptors
      .add(TokenInterceptor(),
      // .add(LogInterceptor(
      //     responseHeader: true,
      //     request: true,
      //     requestHeader: true,
      //     requestBody: true,
      //     responseBody: true
      //   ),
    );

    return _ApiService(dio);
  }

  @GET("/api/games")
  Future<RawgData<List<Game>>> getListOfGames({
    @Query("page") int? page,
    @Query("page_size") int? pageSize,
    @Query("search") String? search,
    @Query("parent_platforms") String? parentPlatform,
    @Query("platforms") String? platforms,
    @Query("stores") String? stores,
    @Query("developers") String? developers,
    @Query("publishers") String? publishers,
    @Query("genres") String? genres,
    @Query("tags") String? tags,
    @Query("creators") String? creators,
    @Query("dates") String? dates,
    @Query("platforms_count") int? platformsCount,
    @Query("exclude_collection") int? excludeCollection,
    @Query("exclude_additions") bool? excludeAdditions,
    @Query("exclude_parents") bool? excludeParents,
    @Query("exclude_game_series") bool? excludeGameSeries,
    @Query("ordering") String? ordering,
  });

  @GET("/api/games/{id}")
  Future<GameSingle> getDetailsOfGame(
      @Path("id") int id,
  );

  @GET("/api/tags/{id}")
  Future<Tag> getTagDetails(
      @Path() int id,
  );

  @GET("/api/genres/{id}")
  Future<Genre> getGenreDetails(
      @Path() int id,
  );

}


