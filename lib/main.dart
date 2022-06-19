import 'package:flutter/material.dart';
import 'package:packerin/data/model/packerin_destination_list_model.dart';
import 'package:packerin/presentation/pages/packerin_about_page.dart';
import 'package:packerin/presentation/pages/packerin_detail_page.dart';
import 'package:packerin/presentation/pages/packerin_explore_page.dart';
import 'package:packerin/presentation/pages/packerin_favorite_page.dart';
import 'package:packerin/presentation/pages/packerin_home_page.dart';
import 'package:packerin/presentation/pages/packerin_profile_page.dart';
import 'package:packerin/presentation/pages/packerin_splash_page.dart';
import 'package:packerin/presentation/widgets/packerin_drawer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Packerin',
      theme: ThemeData(fontFamily: 'Fredoka')
          .copyWith(scaffoldBackgroundColor: Colors.white),
      initialRoute: PackerinHomePage.routeName,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case PackerinSplashPage.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinSplashPage());

          case PackerinHomePage.routeName:
            return MaterialPageRoute(builder: (_) => const PackerinHomePage());

          case PackerinExplorePage.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinExplorePage());

          case PackerinFavoritePage.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinFavoritePage());

          case PackerinProfilePage.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinProfilePage());

          case PackerinDrawerWidget.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinDrawerWidget());

          case PackerinDetailPage.routeName:
            return MaterialPageRoute(
                builder: (_) => PackerinDetailPage(
                    destination:
                        settings.arguments as PackerinDestinationListModel));

          case PackerinAboutPage.routeName:
            return MaterialPageRoute(builder: (_) => const PackerinAboutPage());

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
