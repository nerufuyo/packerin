import 'package:flutter/material.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';

class PackerinProfilePage extends StatefulWidget {
  const PackerinProfilePage({Key? key}) : super(key: key);
  static const routeName = '/packerin-profile';

  @override
  _PackerinProfilePageState createState() => _PackerinProfilePageState();
}

class _PackerinProfilePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.grey.shade300])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: const [Text('Isi')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
