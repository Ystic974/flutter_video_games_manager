import 'package:flutter/cupertino.dart';
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
  int _counter = 0;

  late List<Game>? games;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameNotifierProvider.notifier).getGames(1);
      ref.read(gameNotifierProvider.notifier).getTagDetails(1, int.parse(GameNotifier.tag1));
      ref.read(gameNotifierProvider.notifier).getTagDetails(2, int.parse(GameNotifier.tag2));
      ref.read(gameNotifierProvider.notifier).getGenreDetails(int.parse(GameNotifier.genre1));
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final games = ref.watch(gameNotifierProvider.select((value) => value.games));
    final tag1 = ref.watch(gameNotifierProvider.select((value) => value.tag1));
    final tag2 = ref.watch(gameNotifierProvider.select((value) => value.tag2));
    final genre = ref.watch(gameNotifierProvider.select((value) => value.genre));

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (games != null) ...games!.map((game) => Text("${game.name}")).toList(),
              if (games == null) Text("No data fetch"),

              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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

