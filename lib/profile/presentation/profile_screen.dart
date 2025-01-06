import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_games_manager_flutter/app/auth/auth_notifier.dart';
import 'package:video_games_manager_flutter/generated/assets.dart';
import 'package:video_games_manager_flutter/ressources/app_color.dart';
import 'package:video_games_manager_flutter/search/search_notifier.dart';
import 'package:video_games_manager_flutter/search/utils/search_args.dart';
import '../../api/model/games.dart';
import '../../app/widgets/app_bottom_nav_bar.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider.select((value) => value.user));

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
                  const SizedBox(height: 100),
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
                  const SizedBox(height: 20),
                  Text(
                    'Username',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(searchNotifierProvider.notifier).emptySearchGames();
                    },
                    child: const Text('Logout'),
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
