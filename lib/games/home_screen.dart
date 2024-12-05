import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../api/api_service.dart';
import '../api/model/games.dart';
import 'game_notifier.dart';
import 'game_repository.dart';

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameNotifierProvider.notifier).getGames(1);
      ref.read(gameNotifierProvider.notifier).getHighlightedGame();
      ref.read(gameNotifierProvider.notifier).getTagDetails(1, int.parse(GameNotifier.tag1));
      ref.read(gameNotifierProvider.notifier).getTagDetails(2, int.parse(GameNotifier.tag2));
      ref.read(gameNotifierProvider.notifier).getGenreDetails(int.parse(GameNotifier.genre1));
    });
  }

  @override
  Widget build(BuildContext context) {

    final games = ref.watch(gameNotifierProvider.select((value) => value.games));
    final hightlightGame = ref.watch(gameNotifierProvider.select((value) => value.hightlightGame));
    final tag1 = ref.watch(gameNotifierProvider.select((value) => value.tag1));
    final tag2 = ref.watch(gameNotifierProvider.select((value) => value.tag2));
    final genre = ref.watch(gameNotifierProvider.select((value) => value.genre));

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (hightlightGame == null)
                  const CircularProgressIndicator()
                else
                  HighlightedGameCard(
                    dominantColor: Colors.purple,
                    mutedColor: Colors.purpleAccent,
                    vibrantColor: Colors.white,
                    highlightedGame: hightlightGame,
                    isInWishlist: false,
                    addToWishlist: () {
                      //ref.read(gameNotifierProvider.notifier).addToWishlist(games.first.id);
                    },
                    removeFromWishlist: () {
                      //ref.read(gameNotifierProvider.notifier).removeFromWishlist(games.first.id);
                    },
                  ),
                Carousel(
                  tagName: "Trendy",
                  games: games,
                  getMoreGames: (currentSize) {
                    ref.read(gameNotifierProvider.notifier).getGames(
                      currentSize
                    );
                  },
                  onNavigateToGameDetails: (gameId) {
                    //ref.read(gameNotifierProvider.notifier).navigateToGameDetails(gameId);
                  },
                ),
                Carousel(
                  tagName: tag1 == "" ? "Tag 1" : tag1,
                  games: games,
                  getMoreGames: (currentSize) {
                    ref.read(gameNotifierProvider.notifier).getGamesByTag(
                      currentSize,
                      GameNotifier.tag1,
                    );
                  },
                  onNavigateToGameDetails: (gameId) {
                    //ref.read(gameNotifierProvider.notifier).navigateToGameDetails(gameId);
                  },
                ),
                Carousel(
                  tagName: tag2 == "" ? "Tag 2" : tag2,
                  games: games,
                  getMoreGames: (currentSize) {
                    ref.read(gameNotifierProvider.notifier).getGamesByTag(
                      currentSize,
                      GameNotifier.tag2,
                    );
                  },
                  onNavigateToGameDetails: (gameId) {
                    //ref.read(gameNotifierProvider.notifier).navigateToGameDetails(gameId);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final String tagName;
  final List<Game> games;
  final Function(int currentSize) getMoreGames;
  final Function(int gameId) onNavigateToGameDetails;

  const Carousel({
    Key? key,
    required this.tagName,
    required this.games,
    required this.getMoreGames,
    required this.onNavigateToGameDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        getMoreGames(games.length);
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tagName,
            style: const TextStyle(
              color: Colors.black, // TODO
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: games.length,
            itemBuilder: (context, index) {
              return CarouselItem(
                game: games[index],
                onNavigateToGameDetails: onNavigateToGameDetails,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CarouselItem extends StatelessWidget {
  final Game game;
  final Function(int gameId) onNavigateToGameDetails;

  const CarouselItem({
    Key? key,
    required this.game,
    required this.onNavigateToGameDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onNavigateToGameDetails(game.id);
        //game.addToOwned(); // Assuming Game class has a method to add itself to owned.
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: 150,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: game.backgroundImage != null
                  ? Image.network(
                game.backgroundImage!,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              )
                  : const Placeholder(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.black.withOpacity(0.8),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  game.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HighlightedGameCard extends StatelessWidget {
  final Color dominantColor;
  final Color mutedColor;
  final Color vibrantColor;
  final Game highlightedGame;
  final bool isInWishlist;
  final Function addToWishlist;
  final Function removeFromWishlist;

  const HighlightedGameCard({
    Key? key,
    required this.dominantColor,
    required this.mutedColor,
    required this.vibrantColor,
    required this.highlightedGame,
    required this.isInWishlist,
    required this.addToWishlist,
    required this.removeFromWishlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 520,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [dominantColor, mutedColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Game Image
            Container(
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green, // Fallback color
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: highlightedGame.backgroundImage != null
                        ? Image.network(
                      highlightedGame.backgroundImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                        : const Placeholder(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: dominantColor.withOpacity(0.9),
                      child: Center(
                        child: Text(
                          highlightedGame.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: vibrantColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // HotPic Row
            Row(
              children: [
                Text(
                  "HotPic",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: vibrantColor,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.local_fire_department, color: vibrantColor),
              ],
            ),
            const SizedBox(height: 8),
            // Wishlist Button
            GestureDetector(
              onTap: () {
                if (!isInWishlist) {
                  addToWishlist();
                } else {
                  removeFromWishlist();
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: vibrantColor.withOpacity(0.75),
                ),
                child: Row(
                  children: [
                    Icon(
                      isInWishlist ? Icons.check : Icons.add,
                      color: mutedColor,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      isInWishlist ? "In Wishlist" : "Add to Wishlist",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: mutedColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


