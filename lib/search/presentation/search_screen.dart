import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_games_manager_flutter/generated/assets.dart';
import 'package:video_games_manager_flutter/ressources/app_color.dart';
import 'package:video_games_manager_flutter/search/search_notifier.dart';
import '../../api/model/games.dart';
import '../../app/widgets/app_bottom_nav_bar.dart';

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
    if (searchResults.isNotEmpty) print(searchResults[0].backgroundImage);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: 1,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(gradient: AppColor.blackPurpleGradient),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  AutoCompleteSearchBar(
                      searchController: _searchController,
                      ref: ref,
                      searchResults: searchResults),
                  SizedBox(
                    height: 16,
                  ),
                  //TODO Discovery List
                  //TODO Caroussel
                  //TODO Browse by genre

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _GenreCard(
                        color: AppColor.orange,
                        title: 'Role Play\nGames',
                        asset: Assets.assetsDiskRpg,
                        onTap: () {
                          //TODO Navigate to genre screen
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      _GenreCard(
                        color: AppColor.red,
                        title: 'First Person\nShooter',
                        asset: Assets.assetsDiskFps,
                        onTap: () {
                          //TODO Navigate to genre screen
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _GenreCard(
                        color: AppColor.blue,
                        title: 'Sport\nGames',
                        asset: Assets.assetsDiskSport,
                        onTap: () {
                          //TODO Navigate to genre screen
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      _GenreCard(
                        color: AppColor.pink,
                        title: 'Simulation\nGames',
                        asset: Assets.assetsDiskSimu,
                        onTap: () {
                          //TODO Navigate to genre screen
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GenreCard extends StatelessWidget {
  const _GenreCard({
    super.key, required this.color, required this.title, required this.asset, required this.onTap,
  });

  final Color color;
  final String title;
  final String asset;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          //TODO Navigate to genre screen
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
               Positioned(
                  top: 4,
                  left: 6,
                  child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.white),
              )),

              Positioned(
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(asset, scale: 0.75,),
                  )
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
    widget.ref.read(searchNotifierProvider.notifier).emptySearchGames();
    _focusNode.unfocus();
  }

  void _navToSearchResults() {
    Navigator.of(context).pushNamed('/search/results', arguments: widget.searchController.text);
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
              widget.ref
                  .read(searchNotifierProvider.notifier)
                  .searchGames(query);
            }
          },
          decoration: InputDecoration(
            labelText: 'Search for a game',
            labelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
            floatingLabelStyle: const TextStyle(
                color: AppColor.purple, fontWeight: FontWeight.w500),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(69)),
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(69)),
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(69)),
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
            filled: true,
            fillColor: AppColor.purple30,
            prefixIcon: IconButton(
              icon : const Icon(
                  Icons.search
              ),
              onPressed: widget.searchController.text != '' ? _navToSearchResults : null,
            ),
            suffixIcon: widget.searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                      weight: 200,
                    ),
                    onPressed: _clearSearch,
                  )
                : null,
          ),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        if (_isFocused)
          widget.searchResults.isEmpty
              ? Container()
              : Align(
                child: Container(
                            clipBehavior: Clip.hardEdge,
                    height: 300,
                    decoration: BoxDecoration(
                    ),
                    child: ListView.builder(
                      itemCount: widget.searchResults.length,
                      itemBuilder: (context, index) {
                        final game = widget.searchResults[index];
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 2, left: 8, right: 8),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              tileColor: AppColor.purple30,
                              textColor: Colors.white,
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
                          ),
                        );
                      },
                    ),
                  ),
              ),
      ],
    );
  }
}
