import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/presentation/pages/packerin_explore_page.dart';
import 'package:packerin/presentation/pages/packerin_favorite_page.dart';
import 'package:packerin/presentation/pages/packerin_home_page.dart';
import 'package:packerin/presentation/pages/packerin_profile_page.dart';

class PackerinDrawerWidget extends StatelessWidget {
  static const routeName = '/packerin-drawer';

  const PackerinDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkestBlueColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.55,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                leading: const Icon(Icons.home, color: whiteColor),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, PackerinHomePage.routeName);
                },
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                leading: const Icon(Icons.explore, color: whiteColor),
                title: const Text(
                  'Explore',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, PackerinExplorePage.routeName);
                },
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                leading: const Icon(Icons.favorite, color: whiteColor),
                title: const Text(
                  'Favorite',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, PackerinFavoritePage.routeName);
                },
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                leading: const Icon(Icons.person, color: whiteColor),
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, PackerinProfilePage.routeName);
                },
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                leading: const Icon(Icons.info, color: whiteColor),
                title: const Text(
                  'About',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {},
              ),
            ],
          )),
        ),
      ),
    );
  }
}
