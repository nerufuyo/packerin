import 'package:packerin/data/model/packerin_destination.dart';
import 'package:flutter/foundation.dart';

class PackerinFavoritePageModel extends ChangeNotifier {
  late PackerinDestination _destinationList;
  final List<String> _itemIds = [];

  PackerinDestination get destination => _destinationList;

  set destination(PackerinDestination newList) {
    _destinationList = newList;
    notifyListeners();
  }
}
