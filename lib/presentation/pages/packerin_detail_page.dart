import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/data/model/packerin_destination_list_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PackerinDetailPage extends StatefulWidget {
  static const routeName = '/packerin-detail-page';

  const PackerinDetailPage({Key? key, required this.destination})
      : super(key: key);

  final PackerinDestinationListModel destination;

  @override
  _PackerinDetailPageState createState() => _PackerinDetailPageState();
}

class _PackerinDetailPageState extends State<PackerinDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            widget.destination.pictureId,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 40 + 8, left: 10, right: 10, bottom: 10),
            child: DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: darkGreenColor.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.destination.name,
                                style: const TextStyle(
                                    color: whiteColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Fredoka'),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    widget.destination.city,
                                    style: const TextStyle(
                                        color: whiteColor,
                                        fontSize: 16,
                                        fontFamily: 'Fredoka'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: widget.destination.rating / 1,
                                    itemCount: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    itemSize: 24,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Description',
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Fredoka'),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    widget.destination.description,
                                    style: const TextStyle(
                                        color: whiteColor,
                                        fontSize: 16,
                                        fontFamily: 'Fredoka'),
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
