// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final Function() onTapAbout;

  const DrawerWidget({required this.onTapAbout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        ListTile(
          leading: const Icon(Icons.warning),
          title: const Text('About'),
          onTap: onTapAbout,
        )
      ]),
    );
  }
}
