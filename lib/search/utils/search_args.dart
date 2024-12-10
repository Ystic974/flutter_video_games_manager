class SearchArguments {
  final SearchType type;
  final String? query;
  final int? genreId;
  final int? tagId;

  SearchArguments( {
      required this.type,
      this.query,
      this.genreId,
      this.tagId,
  });
}

enum SearchType {
  search,
  genre,
  tag,
  wishlist,
  owned
}

