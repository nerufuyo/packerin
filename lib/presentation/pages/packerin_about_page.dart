import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PackerinAboutPage extends StatelessWidget {
  const PackerinAboutPage({Key? key}) : super(key: key);
  static const routeName = '/packerin-about';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Text('About Page'),
    );
  }
}
