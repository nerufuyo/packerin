import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/presentation/widgets/packerin_card_widget.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';
import 'package:packerin/presentation/widgets/packerin_search_widget.dart';

class PackerinExplorePage extends StatefulWidget {
  const PackerinExplorePage({Key? key}) : super(key: key);
  static const routeName = '/packerin-explore';

  @override
  _PackerinExplorePageState createState() => _PackerinExplorePageState();
}

class _PackerinExplorePageState extends State {
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Search Destination',
                style: titleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: const [
                  PackerinCardWidget(),
                  PackerinCardWidget(),
                  PackerinCardWidget()
                ],
              ),
            ),
            const PackerinSearchWidget()
          ],
        ),
      ),
    );
  }
}
