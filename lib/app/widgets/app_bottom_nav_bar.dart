import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_games_manager_flutter/games/home_screen.dart';
import 'package:video_games_manager_flutter/search/presentation/search_screen.dart';

import '../../ressources/app_color.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColor.purple,
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      onTap: (index) {
        switch (index) {
          case 0:
            navigateWithFade(
              context,
              MyHomePage(),
            );
            break;
          case 1:
            navigateWithFade(
              context,
              SearchScreen(),
            );
            break;
          // case 2:
          //   navigateWithSlide(
          //     context,
          //     ProfilePage(),
          //     slideToLeft: index > currentIndex,
          //   );
          //   break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          activeIcon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Icon(
                Icons.home,
                color: AppColor.purple,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          activeIcon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Icon(
                Icons.search,
                color: AppColor.purple,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(

          icon: Icon(Icons.person),
          label: 'Profile',
          activeIcon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Icon(
                Icons.person,
                color: AppColor.purple,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


void navigateWithFade(BuildContext context, Widget page) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Crée une animation de fondu
        final fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return FadeTransition(
          opacity: fadeAnimation, // Applique l'opacité
          child: child,
        );
      },
    ),
  );
}