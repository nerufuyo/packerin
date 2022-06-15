import 'package:flutter/material.dart';
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
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.grey.shade300])),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Text(
                  'Explore Destination',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const PackerinSearchWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
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
            ],
          ),
        ),
      ),
    );
  }
}
