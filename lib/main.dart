import 'package:flutter/material.dart';
import 'package:packerin/presentation/pages/packerin_about_page.dart';
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
          case PackerinBottomNavigationWidget.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinBottomNavigationWidget());
          case PackerinSplashPage.routeName:
            return MaterialPageRoute(
                builder: (_) => const PackerinSplashPage());
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
