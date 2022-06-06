import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:packerin/common/style.dart';

class PackerinSearchWidget extends StatelessWidget {
  const PackerinSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Find your destination',
                            fillColor: Colors.grey.shade600,
                            hoverColor: Colors.grey.shade600,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.search_rounded)),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const FaIcon(
                                FontAwesomeIcons.alignCenter,
                                color: whiteColor,
                                size: 30,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
