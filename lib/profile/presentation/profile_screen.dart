import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_games_manager_flutter/app/auth/auth_notifier.dart';
import 'package:video_games_manager_flutter/generated/assets.dart';
import 'package:video_games_manager_flutter/ressources/app_color.dart';
import '../../api/model/games.dart';
import '../../app/widgets/app_bottom_nav_bar.dart';
import '../../games/game_notifier.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameNotifierProvider.notifier).getGames(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider.select((value) => value.user));
    final games = ref.watch(gameNotifierProvider.select((value) => value.games));
    final games2 = ref.watch(gameNotifierProvider.select((value) => value.games2));
    final ownedGames = chunkList(games, 3);
    final wishedGames = chunkList(games2, 3);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: 2,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        icon: const Icon(Icons.logout),
                        iconSize: 30,
                        onPressed: () {
                          ref.read(authNotifierProvider.notifier).signOut();
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: (user?.photoURL != null)
                          ? Image.network(
                              user?.photoURL ?? '',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              Assets.assetsDiskSimu,
                              fit: BoxFit.cover,
                              height: 150,
                              width: 150,
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    (user?.displayName != null)
                    ? user?.displayName ?? ''
                    : 'Unknow user',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                  ),

                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Games',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                      ),
                      Text(
                        'More >',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (ownedGames != null && ownedGames.isNotEmpty)
                          if (ownedGames[0] != null)
                            for (final game in ownedGames[0])
                              Badge(
                                game: game,
                              ),
                      ]
                  ),

                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Wishlist',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                      ),
                      Text(
                        'More >',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (wishedGames != null && wishedGames.isNotEmpty)
                          if (wishedGames[0] != null)
                            for (final game in wishedGames[0])
                              Badge(
                                game: game,
                              ),
                      ]
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (wishedGames != null && wishedGames.isNotEmpty)
                          if (wishedGames[1] != null)
                            for (final game in wishedGames[1])
                              Badge(
                                game: game,
                              ),
                      ]
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final Game game;
  final Color? color;
  final String? imageAsset;

  const Badge({
    Key? key,
    required this.game,
    this.color,
    this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/game_details',
          arguments: game.id,
        );
      },
      child: Container(
        width: 120,
        height: 170,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                game.backgroundImage != null
                ? game.backgroundImage!
                : (imageAsset ?? ''),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              game.name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

}

List<List<Game>> chunkList(List<Game> list, int chunkSize) {
  final List<List<Game>> chunks = [];
  for (var i = 0; i < list.length; i += chunkSize) {
    chunks.add(list.sublist(i, i + chunkSize > list.length ? list.length : i + chunkSize));
  }
  return chunks;
}
