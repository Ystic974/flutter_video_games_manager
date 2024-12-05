import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/api_service.dart';
import '../api/model/games.dart';
import 'game_repository.dart';
import 'home_screen.dart';

class GameState extends Equatable {
  const GameState._({
    this.isLoading = false,
    this.games = const [],
    this.singleGames = null,
    this.tag1 = "",
    this.tag2 = "",
    this.genre = "",
  });

  final List<Game> games;
  final GameSingle? singleGames;
  final bool isLoading;
  final String tag1;
  final String tag2;
  final String genre;

  const GameState.initial() : this._();

  GameState gotGames(List<Game> games) {
    return _copyWith(
      games: games,
    );
  }

  GameState gotGameDetails(GameSingle singleGames) {
    return _copyWith(
      singleGames: singleGames,
    );
  }

  GameState setLoading(bool isLoading) {
    return _copyWith(
      isLoading: isLoading,
    );
  }

  GameState setTag1(String tag1) {
    return _copyWith(
      tag1: tag1,
    );
  }

  GameState setTag2(String tag2) {
    return _copyWith(
      tag2: tag2,
    );
  }

  GameState setGenre(String genre) {
    return _copyWith(
      genre: genre,
    );
  }

  GameState _copyWith({
    bool? isLoading,
    List<Game>? games,
    GameSingle? singleGames,
    String? tag1,
    String? tag2,
    String? genre,
  }) {
    return GameState._(
      isLoading: isLoading ?? this.isLoading,
      games: games ?? this.games,
      singleGames: singleGames ?? this.singleGames,
      tag1: tag1 ?? this.tag1,
      tag2: tag2 ?? this.tag2,
      genre: genre ?? this.genre,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    games,
    singleGames
  ];

  GameState gotMoreGames(List<Game> results) {
    return _copyWith(
      isLoading: false,
      games: [...games, ...results],
    );
  }

}
