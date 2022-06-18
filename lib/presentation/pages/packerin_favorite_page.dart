import 'package:flutter/material.dart';
import 'package:packerin/common/style.dart';
import 'package:packerin/data/model/packerin_destination_list_model.dart';
import 'package:packerin/data/model/packerin_destination_model.dart';
import 'package:packerin/presentation/widgets/packerin_card_widget.dart';
import 'package:packerin/presentation/widgets/packerin_header_widget.dart';

class PackerinFavoritePage extends StatefulWidget {
  const PackerinFavoritePage({Key? key}) : super(key: key);
  static const routeName = '/packerin-favorite';

  @override
  _PackerinFavoritePageState createState() => _PackerinFavoritePageState();
}

class _PackerinFavoritePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.grey.shade400]),
        ),
        duration: const Duration(milliseconds: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const HeaderWidget(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                'Favorite Destination',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: FutureBuilder<String>(
                    future: DefaultAssetBundle.of(context)
                        .loadString('assets/data/local_destination.json'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.hasData) {
                          final List<PackerinDestinationListModel> destination =
                              parseDestination(snapshot.data!);

                          return Expanded(
                              child:
                                  PackerinCardWidget(destination: destination));
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
    );
  }
}
