import 'dart:convert';

import 'package:packerin/data/model/packerin_citydestination_list_model.dart';

class PackerinCitydestinationModel {
  // Declarate Variable
  List<PackerinCitydestinationListModel> citydestination;

  // Callback Variable
  PackerinCitydestinationModel({required this.citydestination});

  // Convert Json to Local Variable
  factory PackerinCitydestinationModel.fromJson(Map<String, dynamic> json) =>
      PackerinCitydestinationModel(
          citydestination: List<PackerinCitydestinationListModel>.from(
              json["citydestination"]
                  .map((x) => PackerinCitydestinationListModel.fromJson(x))));

  // Mapping Local Variable
  Map<String, dynamic> toJson() =>
      {"citydestination": List<dynamic>.from(citydestination.map((x) => x.toJson()))};
}

// Decode Json
PackerinCitydestinationModel citydestinationFromJson(String str) =>
    PackerinCitydestinationModel.fromJson(json.decode(str));

// Encode Json
String citydestinationToJson(PackerinCitydestinationModel data) =>
    json.encode(data.toJson());

// Parse Json
List<PackerinCitydestinationListModel> parseCitydestination(String json) {
  final List parsed = jsonDecode(json)["citydestination"];
  return parsed
      .map((json) => PackerinCitydestinationListModel.fromJson(json))
      .toList();
}
