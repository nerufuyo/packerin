import 'dart:math';
import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/presentation/pages/packerin_favorite_page.dart';
import 'package:packerin/presentation/pages/packerin_main_page.dart';
import 'package:packerin/presentation/pages/packerin_explore_page.dart';
import 'package:packerin/presentation/pages/packerin_profile_page.dart';
import 'package:packerin/presentation/widgets/packerin_drawer_widget.dart';

class PackerinBottomNavigationWidget extends StatefulWidget {
  const PackerinBottomNavigationWidget({Key? key}) : super(key: key);
  static const routeName = '/packerin-home';

  @override
  _PackerinBottomNavigationWidgetState createState() =>
      _PackerinBottomNavigationWidgetState();
}

class _PackerinBottomNavigationWidgetState
    extends State<PackerinBottomNavigationWidget> {
  double value = 0;
  int currentIndex = 0;
  final screens = [
    const PackerinMainPage(),
    const PackerinExplorePage(),
    const PackerinFavoritePage(),
    const PackerinProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue.shade600],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          const PackerinDrawerWidget(),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: const Duration(milliseconds: 200),
              builder: (_, double val, __) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val),
                  child: Scaffold(
                    body: Stack(children: [
                      IndexedStack(
                        index: currentIndex,
                        children: screens,
                      ),
                    ]),
                  ),
                );
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) => setState((() => currentIndex = index)),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
