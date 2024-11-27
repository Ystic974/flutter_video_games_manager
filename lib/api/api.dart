import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../env/env.dart';
import '../model/games.dart';

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

  @GET("/api/games")
  Future<List<Game>> getListOfGames();

  @GET("/api/games/{id}")
  Future<GameSingle> getDetailsOfGame();

}


