import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/data/model/packerin_destination_list_model.dart';
import 'package:packerin/data/model/packerin_destination_model.dart';
import 'package:packerin/presentation/widgets/packerin_drawer_widget.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';
import 'package:packerin/presentation/widgets/packerin_search_widget.dart';

class PackerinExplorePage extends StatefulWidget {
  const PackerinExplorePage({Key? key}) : super(key: key);
  static const routeName = '/packerin-explore';

  @override
  _PackerinExplorePageState createState() => _PackerinExplorePageState();
}

class _PackerinExplorePageState extends State {
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
      resizeToAvoidBottomInset: true,
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
                        padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                        child: Text(
                          'Explore Destination',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const PackerinSearchWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
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
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(height: 5),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: destination.length,
                                      itemBuilder: (context, index) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(0.0, 1.0),
                                                    blurRadius: 6.0,
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 5),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        destination[index]
                                                            .pictureId,
                                                        height: 100,
                                                        width: 150,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            destination[index]
                                                                .name,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                destination[
                                                                        index]
                                                                    .rating
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              )
                                                            ],
                                                          ),
                                                          Text(
                                                            destination[index]
                                                                .city,
                                                            style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade600,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          Text(
                                                            destination[index]
                                                                .description,
                                                            style: detailText,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
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
