// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';

class PackerinProfilePage extends StatefulWidget {
  const PackerinProfilePage({Key? key}) : super(key: key);
  static const routeName = '/packerin-profile';

  @override
  _PackerinProfilePageState createState() => _PackerinProfilePageState();
}

class _PackerinProfilePageState extends State {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
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
                                borderRadius: BorderRadius.circular(20)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
