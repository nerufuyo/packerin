import 'package:flutter/material.dart';
import 'package:packerin/presentation/pages/packerin_favorite_page.dart';
import 'package:packerin/presentation/pages/packerin_main_page.dart';
import 'package:packerin/presentation/pages/packerin_explore_page.dart';
import 'package:packerin/presentation/pages/packerin_profile_page.dart';

class PackerinBottomNavigationWidget extends StatefulWidget {
  const PackerinBottomNavigationWidget({Key? key}) : super(key: key);
  static const routeName = '/packerin-home';

  @override
  _PackerinBottomNavigationWidgetState createState() =>
      _PackerinBottomNavigationWidgetState();
}

class _PackerinBottomNavigationWidgetState
    extends State<PackerinBottomNavigationWidget> {
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
      body: IndexedStack(
        index: currentIndex,
        children: screens,
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
