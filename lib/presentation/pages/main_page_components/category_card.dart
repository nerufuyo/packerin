import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.category_outlined,
                          color: Colors.white,
                        ),
                        _spaceDivider(),
                        const Text(
                          'All',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
              )),
        ),
        InkWell(
          onTap: () {},
          child: Card(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Icon(Icons.temple_buddhist),
                    _spaceDivider(),
                    const Text('Temple')
                  ],
                )),
          )),
        ),
        InkWell(
          onTap: () {},
          child: Card(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Icon(Icons.location_city_outlined),
                    _spaceDivider(),
                    const Text('City')
                  ],
                )),
          )),
        )
      ],
    );
  }
}

SizedBox _spaceDivider() {
  return const SizedBox(
    width: 5,
  );
}
