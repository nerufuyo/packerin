import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';

class PackerinDrawerWidget extends StatelessWidget {
  static const routeName = '/packerin-drawer';

  const PackerinDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DrawerHeader(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: Image.asset('assets/profile.jpg').image,
                  ),
                ),
                const Text(
                  'Kim Jeong Unch',
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.info_outline,
                      color: whiteColor,
                    ),
                    title: const Text(
                      'About',
                      style: TextStyle(color: whiteColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
