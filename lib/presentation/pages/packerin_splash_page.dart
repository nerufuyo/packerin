import 'dart:async';
import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/presentation/widgets/packerin_bottom_navigation_widget.dart';

class PackerinSplashPage extends StatefulWidget {
  static const routeName = '/splash_screen';

  const PackerinSplashPage({Key? key}) : super(key: key);

  @override
  _PackerinSplashPageState createState() => _PackerinSplashPageState();
}

class _PackerinSplashPageState extends State<PackerinSplashPage> {
  startTime() {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationRoute);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationRoute() {
    Navigator.pushReplacementNamed(
        context, PackerinBottomNavigationWidget.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('PACKERIN', style: titleText),
          ],
        ),
      ),
    );
  }
}
