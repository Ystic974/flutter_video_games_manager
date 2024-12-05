import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/api_service.dart';
import '../api/model/games.dart';
import '../utils/color_extractor.dart';
import 'game_repository.dart';
import 'home_screen.dart';

class GameState extends Equatable {
  const GameState._({
    this.isLoading = false,
    this.games = const [],
    this.games2 = const [],
    this.games3 = const [],
    this.hightlightGame = null,
    this.tag1 = "",
    this.tag2 = "",
    this.genre = "",
    this.dominantColor = Colors.purple,
    this.mutedColor = Colors.purpleAccent,
    this.vibrantColor = Colors.white,
  });

  final List<Game> games;
  final List<Game> games2;
  final List<Game> games3;
  final Game? hightlightGame;
  final bool isLoading;
  final String tag1;
  final String tag2;
  final String genre;
  final Color dominantColor, mutedColor, vibrantColor;

  const GameState.initial() : this._();

  GameState gotGames(List<Game> games) {
    return _copyWith(
      games: games,
    );
  }

  GameState gotGames2(List<Game> games2) {
    return _copyWith(
      games2: games2,
    );
  }

  GameState gotGames3(List<Game> games3) {
    return _copyWith(
      games3: games3,
    );
  }

  GameState gotHightlightGame(Game hightlightGame) {
    return _copyWith(
      hightlightGame: hightlightGame,
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

  GameState setColors(Color? dominantColor, Color? mutedColor, Color? vibrantColor) {
    return _copyWith(
      dominantColor: dominantColor ?? this.dominantColor,
      mutedColor: mutedColor ?? this.mutedColor,
      vibrantColor: vibrantColor ?? this.vibrantColor,
    );
  }

  GameState gotMoreGames(List<Game> results) {
    return _copyWith(
      isLoading: false,
      games: [...games, ...results],
    );
  }

  GameState _copyWith({
    bool? isLoading,
    List<Game>? games,
    List<Game>? games2,
    List<Game>? games3,
    Game? hightlightGame,
    String? tag1,
    String? tag2,
    String? genre,
    Color? dominantColor,Color? mutedColor, Color? vibrantColor,
  }) {
    return GameState._(
      isLoading: isLoading ?? this.isLoading,
      games: games ?? this.games,
      games2: games2 ?? this.games2,
      games3: games3 ?? this.games3,
      hightlightGame: hightlightGame ?? this.hightlightGame,
      tag1: tag1 ?? this.tag1,
      tag2: tag2 ?? this.tag2,
      genre: genre ?? this.genre,
      dominantColor: dominantColor ?? this.dominantColor,
      mutedColor: mutedColor ?? this.mutedColor,
      vibrantColor: vibrantColor ?? this.vibrantColor,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    games,
    games2,
    games3,
    hightlightGame,
    tag1,
    tag2,
    genre,
    dominantColor,
    mutedColor,
    vibrantColor,
  ];

}
