import 'package:flutter/material.dart';
import 'package:packerin/presentation/pages/main_page_components/category_card.dart';
import 'package:packerin/presentation/pages/main_page_components/content_card.dart';
import 'package:packerin/presentation/pages/main_page_components/welcome_text.dart';
import 'package:packerin/presentation/widgets/header_widget.dart';

class PackerinMainPage extends StatefulWidget {
  const PackerinMainPage({Key? key}) : super(key: key);
  static const routeName = '/packerin-home';

  @override
  State<PackerinMainPage> createState() => _PackerinMainPage();
}

class _PackerinMainPage extends State<PackerinMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.grey.shade700])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: const [
                  WelcomeTextMainScreen(),
                  CategoryCard(),
                  ContentCard()
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
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
