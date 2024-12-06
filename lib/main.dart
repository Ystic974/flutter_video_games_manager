import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_games_manager_flutter/config/injection.dart';
import 'package:video_games_manager_flutter/search/search_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
    ),);
  }
}




