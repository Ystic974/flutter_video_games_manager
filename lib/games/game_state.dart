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
  });

  final List<Game> games;
  final GameSingle? singleGames;
  final bool isLoading;

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


  GameState _copyWith({
    bool? isLoading,
    List<Game>? games,
    GameSingle? singleGames,
  }) {
    return GameState._(
      isLoading: isLoading ?? this.isLoading,
      games: games ?? this.games,
      singleGames: singleGames ?? this.singleGames,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    games,
    singleGames
  ];

}
