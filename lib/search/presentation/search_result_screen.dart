import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_games_manager_flutter/app/loader/app_loader.dart';
import 'package:video_games_manager_flutter/generated/assets.dart';
import 'package:video_games_manager_flutter/ressources/app_color.dart';
import 'package:video_games_manager_flutter/search/search_notifier.dart';
import '../../api/model/games.dart';
import '../../games/game_notifier.dart';

class SearchResultScreen extends StatefulHookConsumerWidget {
  const SearchResultScreen({super.key, required this.query});

  final String query;

  @override
  ConsumerState<SearchResultScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchResultScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchNotifierProvider.notifier).emptySearchGames();
      ref
          .read(searchNotifierProvider.notifier)
          .getGameBySearch(widget.query, 1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(
      searchNotifierProvider.select((value) => value.searchResults),
    );

    return SafeArea(
      child: Scaffold(
        body: AppLoader(
          isLoading: ref
              .watch(searchNotifierProvider.select((value) => value.isLoading)),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(gradient: AppColor.whitePurpleGradient),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      if (index == searchResults.length - 1) {
                        ref
                            .read(searchNotifierProvider.notifier)
                            .getGameBySearch(
                                widget.query, searchResults.length);
                      }

                      return Card(
                        color: Colors.white.withOpacity(0),
                        shadowColor: Colors.white.withOpacity(0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child:searchResults[index].backgroundImage!=null ? Image.network(
                                searchResults[index].backgroundImage!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: progress.expectedTotalBytes != null
                                          ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                                          : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    Assets.assetsImagePlaceholder,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ):
                              Image.asset(
                                Assets.assetsImagePlaceholder,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Flexible(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                searchResults[index].name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
