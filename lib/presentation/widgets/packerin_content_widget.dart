import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/data/model/packerin_destination_list_model.dart';

class PackerinContentWidget extends StatelessWidget {
  const PackerinContentWidget({Key? key, required this.destination})
      : super(key: key);

  final List<PackerinDestinationListModel> destination;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: destination.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/packerin-detail-page',
                  arguments: destination[index]);
            },
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
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        destination[index].pictureId,
                        height: 100,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                destination[index].rating.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              )
                            ],
                          ),
                          Text(
                            destination[index].city,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            destination[index].description,
                            style: detailText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
    );
  }
}
