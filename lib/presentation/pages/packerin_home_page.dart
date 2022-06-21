import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/data/model/packerin_destination_list_model.dart';
import 'package:packerin/data/model/packerin_destination_model.dart';
import 'package:packerin/presentation/widgets/packerin_card_widget.dart';
import 'package:packerin/presentation/widgets/packerin_content_widget.dart';
import 'package:packerin/presentation/widgets/packerin_drawer_widget.dart';
import 'package:packerin/presentation/widgets/packerin_filter_widget.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';

class PackerinHomePage extends StatefulWidget {
  const PackerinHomePage({Key? key}) : super(key: key);
  static const routeName = '/packerin-home-page';

  @override
  PackerinHomePageState createState() => PackerinHomePageState();
}

class PackerinHomePageState extends State {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
  }

  void drawerOpen() => setState(() {
        xOffset = 230;
        yOffset = 160;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  void drawerClose() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (isDrawerOpen) {
            drawerClose();
            return false;
          } else {
            return true;
          }
        },
        child: GestureDetector(
          onTap: drawerClose,
          onHorizontalDragUpdate: (details) {
            const delta = 1;
            if (details.delta.dx > delta) {
              drawerOpen();
            } else if (details.delta.dx < -delta) {
              drawerClose();
            }
          },
          child: Stack(
            children: [
              const PackerinDrawerWidget(),
              AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.white, Colors.grey.shade400]),
                ),
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.translationValues(xOffset, yOffset, 0)
                  ..scale(scaleFactor),
                child: AbsorbPointer(
                  absorbing: isDrawerOpen,
                  child: Column(
                    children: [
                      HeaderWidget(
                        onTapDrawerOpen: () {
                          drawerOpen();
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 5, bottom: 5),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              Row(
                                children: const [
                                  Text('Where do you',
                                      style: TextStyle(fontSize: 20)),
                                  Text(' want to go',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
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
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    Icons.temple_buddhist),
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
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              children: [
                                                const Icon(Icons
                                                    .location_city_outlined),
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
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 425,
                                child: FutureBuilder<String>(
                                  future: DefaultAssetBundle.of(context)
                                      .loadString(
                                          'assets/data/local_destination.json'),
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
                              const SizedBox(height: 5),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: FutureBuilder<String>(
                                  future: DefaultAssetBundle.of(context)
                                      .loadString(
                                          'assets/data/local_destination.json'),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
