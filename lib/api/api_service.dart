import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:video_games_manager_flutter/api/rawg_data.dart';
import 'package:video_games_manager_flutter/api/token_interceptor.dart';
import '../env/env.dart';
import 'model/games.dart';

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
  Future<RawgData<List<Game>>> getListOfGames(
      @Body() ListOfGamesParams,
  );

  @GET("/api/games/{id}")
  Future<GameSingle> getDetailsOfGame(
      @Body() DetailsOfGameParams,
  );

}


