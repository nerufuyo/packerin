import 'dart:convert';

import 'package:packerin/data/model/packerin_destination_list_model.dart';

class PackerinDestinationModel {
  // Declarate Variable
  List<PackerinDestinationListModel> destination;

  // Callback Variable
  PackerinDestinationModel({required this.destination});

  // Convert Json to Local Variable
  factory PackerinDestinationModel.fromJson(Map<String, dynamic> json) =>
      PackerinDestinationModel(
          destination: List<PackerinDestinationListModel>.from(
              json["destination"]
                  .map((x) => PackerinDestinationListModel.fromJson(x))));

  // Mapping Local Variable
  Map<String, dynamic> toJson() =>
      {"destination": List<dynamic>.from(destination.map((x) => x.toJson()))};
}

// Decode Json
PackerinDestinationModel destinationFromJson(String str) =>
    PackerinDestinationModel.fromJson(json.decode(str));

// Encode Json
String destinationToJson(PackerinDestinationModel data) =>
    json.encode(data.toJson());

// Parse Json
List<PackerinDestinationListModel> parseDestination(String json) {
  final List parsed = jsonDecode(json)["destination"];
  return parsed
      .map((json) => PackerinDestinationListModel.fromJson(json))
      .toList();
}
