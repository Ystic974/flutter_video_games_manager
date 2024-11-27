import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../env/env.dart';

part 'api.g.dart';

@singleton
@RestApi()
abstract class Api {
  @factoryMethod
  factory Api() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.apiUrl,
        contentType: "application/json",
      ),
    );
    dio.interceptors
      .add(LogInterceptor(
          responseHeader: true,
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true
        ),
    );


    return _Api(dio);
  }

  /*@GET("/api/games")
  Future<List<Game>> getListOfGames(
  @Query("key") key: String,
  @Query("page") page: Int? = null,
  @Query("page_size") pageSize: Int? = null,
  @Query("search") search: String? = null,
  @Query("parent_platforms") parentPlatform: String? = null,
  @Query("platforms") platforms: String? = null,
  @Query("stores") stores: String? = null,
  @Query("developers") developers: String? = null,
  @Query("publishers") publishers: String? = null,
  @Query("genres") genres: String? = null,
  @Query("tags") tags: String? = null,
  @Query("creators") creators: String? = null,
  @Query("dates") dates: String? = null,
  @Query("platforms_count") platformsCount: Int? = null,
  @Query("exclude_collection") excludeCollection: Int? = null,
  @Query("exclude_additions") excludeAdditions: Boolean? = null,
  @Query("exclude_parents") excludeParents: Boolean? = null,
  @Query("exclude_game_series") excludeGameSeries: Boolean? = null,
  @Query("ordering") ordering: String? = null
  ): RawgApiResult<RawgData<List<Game>>>*/

}


