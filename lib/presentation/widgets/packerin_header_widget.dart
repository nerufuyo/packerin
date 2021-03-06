// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HeaderWidget extends StatefulWidget {
  final Function() onTapDrawerOpen;

  const HeaderWidget({Key? key, required this.onTapDrawerOpen})
      : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool servicestatus = false;
  bool haspermission = false;
  bool isDrawerOpen = false;
  late LocationPermission permission;
  late Position position;
  String address = '';

  @override
  void initState() {
    checkGps();
    super.initState();
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        }
      } else if (haspermission = true) {
        getLocation();
      }
    }
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      address = placemarks[0].locality! + ", " + placemarks[0].country!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.06,
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.menu_open_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isDrawerOpen = true;
                        });
                        widget.onTapDrawerOpen();
                      },
                    ),
                    Column(
                      children: [
                        Text(
                          'Current Location',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Colors.red,
                              size: 15,
                            ),
                            Text(
                              address,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
