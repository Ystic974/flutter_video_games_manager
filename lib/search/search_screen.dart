import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_games_manager_flutter/search/search_notifier.dart';
import '../api/model/games.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(
      searchNotifierProvider.select((value) => value.searchResults),
    );
    if(searchResults.isNotEmpty)print(searchResults[0].backgroundImage);

    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
          child: Column(
            children: [
              AutoCompleteSearchBar(searchController: _searchController, ref: ref, searchResults: searchResults),
              Container(
                height: 300,
                  color: Colors.red,
              ),Container(
                height: 300,
                color: Colors.blueAccent,
              )


            ],
          ),
        ),
      ),
    );
  }
}

class AutoCompleteSearchBar extends StatefulWidget {
  const AutoCompleteSearchBar({
    super.key,
    required this.searchController,
    required this.ref,
    required this.searchResults,
  });

  final TextEditingController searchController;
  final WidgetRef ref;
  final List<Game> searchResults;

  @override
  _AutoCompleteSearchBarState createState() => _AutoCompleteSearchBarState();
}
class _AutoCompleteSearchBarState extends State<AutoCompleteSearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _clearSearch() {
    widget.searchController.clear();
    widget.ref.read(searchNotifierProvider.notifier).emptySearchGames(); // Pass empty query to clear search results
    _focusNode.unfocus(); // Remove focus from the text field
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.searchController,
          focusNode: _focusNode,
          onChanged: (query) {
            if (query.isNotEmpty && query != '') {
              widget.ref.read(searchNotifierProvider.notifier).searchGames(query);
            }
          },
          decoration: InputDecoration(
            labelText: 'Search for a game',
            border: const OutlineInputBorder(),
            suffixIcon: widget.searchController.text.isNotEmpty
                ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: _clearSearch, // Clear search when clicked
            )
                : null,
          ),
        ),
        if (_isFocused)
          widget.searchResults.isEmpty
              ? Container()
              : ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 300), // Max height of 300
            child: ListView.builder(
              itemCount: widget.searchResults.length,
              itemBuilder: (context, index) {
                final game = widget.searchResults[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 2, left: 8, right: 8),
                  child: ListTile(
                    leading: game.backgroundImage != null
                        ? Container(
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          game.backgroundImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : Container(
                      color: Colors.grey,
                      width: 70,
                      height: 70,
                    ),
                    title: Text(game.name),
                    onTap: () {
                      debugPrint('Game selected: ${game.name}');
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
