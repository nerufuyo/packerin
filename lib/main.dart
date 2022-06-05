import 'package:flutter/material.dart';
import 'package:packerin/presentation/pages/packerin_about_page.dart';
import 'package:packerin/presentation/pages/packerin_explore_page.dart';
import 'package:packerin/presentation/pages/packerin_favorite_page.dart';
import 'package:packerin/presentation/pages/packerin_main_page.dart';
import 'package:packerin/presentation/pages/packerin_profile_page.dart';
import 'package:packerin/presentation/pages/packerin_splash_page.dart';
import 'package:packerin/presentation/widgets/packerin_bottom_navigation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(scaffoldBackgroundColor: Colors.white),
      initialRoute: PackerinSplashPage.routeName,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case PackerinSplashPage.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinSplashPage());

          case PackerinMainPage.routeName:
            return MaterialPageRoute(builder: (_) => const PackerinMainPage());

          case PackerinExplorePage.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinExplorePage());

          case PackerinFavoritePage.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinFavoritePage());

          case PackerinProfilePage.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinProfilePage());

          case PackerinAboutPage.routeName:
            return MaterialPageRoute(builder: (_) => const PackerinAboutPage());

          case PackerinBottomNavigationWidget.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinBottomNavigationWidget());
          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text('Page not found :('),
                ),
              );
            });
        }
      },
    );
  }
}
