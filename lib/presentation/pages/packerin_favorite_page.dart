import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/data/model/packerin_destination_list_model.dart';
import 'package:packerin/data/model/packerin_destination_model.dart';
import 'package:packerin/presentation/widgets/packerin_content_widget.dart';
import 'package:packerin/presentation/widgets/packerin_drawer_widget.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';

class PackerinFavoritePage extends StatefulWidget {
  const PackerinFavoritePage({Key? key}) : super(key: key);
  static const routeName = '/packerin-favorite';

  @override
  _PackerinFavoritePageState createState() => _PackerinFavoritePageState();
}

class _PackerinFavoritePageState extends State {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderWidget(
                        onTapDrawerOpen: () {
                          drawerOpen();
                        },
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Text(
                          'Favorite Destination',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: FutureBuilder<String>(
                              future: DefaultAssetBundle.of(context).loadString(
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
