import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:video_games_manager_flutter/app/auth/presentation/signup_screen.dart';
import 'package:video_games_manager_flutter/config/injection.dart';
import 'package:video_games_manager_flutter/games/game_repository.dart';
import 'package:video_games_manager_flutter/app/auth/presentation/login_screen.dart';
import 'package:video_games_manager_flutter/profile/presentation/profile_screen.dart';
import 'package:video_games_manager_flutter/search/presentation/search_result_screen.dart';
import 'package:video_games_manager_flutter/search/presentation/search_screen.dart';
import 'package:video_games_manager_flutter/search/utils/search_args.dart';

import 'games/game_details_screen.dart';
import 'firebase_options.dart';
import 'games/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/search/results': (context) => SearchResultScreen(args: ModalRoute.of(context)!.settings.arguments as SearchArguments),        //TODO
        '/game_details': (context) => GameDetailsPage(gameId: ModalRoute.of(context)!.settings.arguments as int),
        //TODO
        '/profile' : (context) => const ProfileScreen(),
        '/login': (context) =>  const LoginScreen(),
        '/signup': (context) => const SignupScreen(),

      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
    ),);
  }
}




