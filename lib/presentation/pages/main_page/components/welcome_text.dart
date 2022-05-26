import 'package:flutter/material.dart';

class WelcomeTextMainScreen extends StatelessWidget {
  const WelcomeTextMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'Where do you',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          ' want to go',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          '?',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
