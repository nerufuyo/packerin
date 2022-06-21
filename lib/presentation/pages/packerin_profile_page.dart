// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/presentation/widgets/packerin_drawer_widget.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';

class PackerinProfilePage extends StatefulWidget {
  const PackerinProfilePage({Key? key}) : super(key: key);
  static const routeName = '/packerin-profile';

  @override
  _PackerinProfilePageState createState() => _PackerinProfilePageState();
}

class _PackerinProfilePageState extends State {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  @override
  void initState() {
    super.initState();
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: Image.asset(
                                    'assets/images/profile.jpg',
                                    width: 125,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: Colors.brown,
                                      child: const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          'Bronze',
                                          style: TextStyle(
                                              color: whiteColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Kim Jeon Unch',
                                      style: nameText,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'leader.kim@nkorea.com',
                                      style: subNameText,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 350,
                              height: 3,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.dark_mode),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Dark Mode',
                                          style: nameText,
                                        )
                                      ],
                                    ),
                                    Switch(
                                      value: isSwitched,
                                      onChanged: toggleSwitch,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.notifications_active),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Notification',
                                          style: nameText,
                                        )
                                      ],
                                    ),
                                    Switch(
                                      value: isSwitched,
                                      onChanged: toggleSwitch,
                                    )
                                  ],
                                ),
                              ),
                            )
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
      ),
    );
  }
}
