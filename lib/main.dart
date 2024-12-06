import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_games_manager_flutter/config/injection.dart';
import 'package:video_games_manager_flutter/games/game_repository.dart';
import 'package:video_games_manager_flutter/search/search_screen.dart';

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
      routes: {
        '/home': (context) => const MyHomePage(),
        '/search': (context) => const SearchScreen(),
        //TODO
        //'/profile' : (context) => const ProfileScreen(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
    ),);
  }
}




