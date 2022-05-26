import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            onTap: () {},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/mountains.jpg',
                            width: 330,
                            height: 340,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Mountain Everest',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '4.9',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              size: 20,
                            ),
                            Text(
                              'Greenland, United States',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
