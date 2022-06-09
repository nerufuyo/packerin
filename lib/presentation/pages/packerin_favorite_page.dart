import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/presentation/widgets/packerin_card_widget.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';

class PackerinFavoritePage extends StatefulWidget {
  const PackerinFavoritePage({Key? key}) : super(key: key);
  static const routeName = '/packerin-favorite';

  @override
  _PackerinFavoritePageState createState() => _PackerinFavoritePageState();
}

class _PackerinFavoritePageState extends State {
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                'Favorite Destination',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 700,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: const [
                        PackerinCardWidget(),
                        PackerinCardWidget(),
                        PackerinCardWidget(),
                        PackerinCardWidget(),
                        PackerinCardWidget(),
                        PackerinCardWidget()
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
