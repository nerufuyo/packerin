import 'package:flutter/material.dart';
import 'package:packerin/presentation/widgets/packerin_card_widget.dart';
import 'package:packerin/presentation/widgets/packerin_content_widget.dart';
import 'package:packerin/presentation/widgets/packerin_filter_widget.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';

class PackerinMainPage extends StatefulWidget {
  const PackerinMainPage({Key? key}) : super(key: key);
  static const routeName = '/packerin-bottom';

  @override
  _PackerinMainPageState createState() => _PackerinMainPageState();
}

class _PackerinMainPageState extends State {
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
                colors: [Colors.white, Colors.grey.shade300])),
        child: Column(
          children: [
            const HeaderWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: const [
                        Text('Where do you', style: TextStyle(fontSize: 20)),
                        Text(' want to go',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('?', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          const PackerinFilterWidget(),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.temple_buddhist),
                                      _spaceDivider(),
                                      const Text('Temple')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_city_outlined),
                                      _spaceDivider(),
                                      const Text('City')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 425,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: const [
                          PackerinContentWidget(),
                          PackerinContentWidget(),
                          PackerinContentWidget(),
                          PackerinContentWidget(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: const [
                          PackerinCardWidget(),
                          PackerinCardWidget(),
                          PackerinCardWidget(),
                          PackerinCardWidget()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SizedBox _spaceDivider() {
  return const SizedBox(
    width: 5,
  );
}
