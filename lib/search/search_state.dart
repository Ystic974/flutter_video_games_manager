import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/api_service.dart';
import '../api/model/games.dart';

class SearchState extends Equatable {
  const SearchState._({
    this.isLoading = false,
    this.searchResults = const [],
  });

  final List<Game> searchResults;
  final bool isLoading;

  const SearchState.initial() : this._();

  SearchState gotSearchResults(List<Game> games) {
    return _copyWith(
      searchResults: games,
    );
  }


  SearchState _copyWith({
    bool? isLoading,
    List<Game>? searchResults,
  }) {
    return SearchState._(
      isLoading: isLoading ?? this.isLoading,
      searchResults: searchResults ?? this.searchResults,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    searchResults,
  ];

}
