import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_games_manager_flutter/config/injection.dart';
import 'package:video_games_manager_flutter/games/game_repository.dart';

import 'api/api_service.dart';
import 'api/model/games.dart';
import 'api/params/list_games_params.dart';
import 'api/rawg_data.dart';
import 'games/home_screen.dart';

void main() {
  runApp(const MyApp());

  try {
    configureDependencies();
  } catch (e) {
    print(Exception(e));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child:
      MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    ),);
  }
}




