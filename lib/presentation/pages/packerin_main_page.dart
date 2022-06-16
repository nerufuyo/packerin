import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/data/model/packerin_destination_list_model.dart';
import 'package:packerin/data/model/packerin_destination_model.dart';
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
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 15, bottom: 5),
                child: ListView(
                  padding: EdgeInsets.zero,
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
                      child: FutureBuilder<String>(
                        future: DefaultAssetBundle.of(context)
                            .loadString('assets/data/local_destination.json'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (snapshot.hasData) {
                              final List<PackerinDestinationListModel>
                                  destination =
                                  parseDestination(snapshot.data!);

                              return Expanded(
                                child: PackerinContentWidget(
                                    destination: destination),
                              );
                            } else {
                              return Center(
                                child: Text('Destination Not Found',
                                    style: subTitleText),
                              );
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: FutureBuilder<String>(
                        future: DefaultAssetBundle.of(context)
                            .loadString('assets/data/local_destination.json'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (snapshot.hasData) {
                              final List<PackerinDestinationListModel>
                                  destination =
                                  parseDestination(snapshot.data!);

                              return Expanded(
                                  child: PackerinCardWidget(
                                      destination: destination));
                            } else {
                              return Center(
                                child: Text('Destination Not Found',
                                    style: subTitleText),
                              );
                            }
                          }
                        },
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
