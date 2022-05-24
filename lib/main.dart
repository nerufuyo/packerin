import 'package:flutter/material.dart';
import 'package:packerin/presentation/pages/packerin_about_page.dart';
import 'package:packerin/presentation/pages/packerin_main_page.dart';

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
      home: const PackerinMainPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
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
