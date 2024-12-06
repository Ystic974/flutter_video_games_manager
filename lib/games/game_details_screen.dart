import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'game_notifier.dart';

class GameDetailsPage extends StatefulHookConsumerWidget {
  const GameDetailsPage({super.key});
  @override
  ConsumerState<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends ConsumerState<GameDetailsPage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // super.initState();
    final int gameId = ModalRoute.of(context)!.settings.arguments as int;
    //WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameNotifierProvider.notifier).getGameDetails(gameId);
    //});
  }

  @override
  Widget build(BuildContext context) {
    final gameSingle = ref.watch(gameNotifierProvider.select((value) => value.gameSingle));

    return Scaffold(
      appBar: AppBar(
        title: Text("Game Details"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("Game Details ${gameSingle?.name} \n ${gameSingle?.description}"),
      ),
    );
  }
}