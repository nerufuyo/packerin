import 'dart:convert';

import 'package:packerin/data/model/packerin_templedestination_list_model.dart';

class PackerinTempledestinationModel {
  // Declarate Variable
  List<PackerinTempledestinationListModel> templedestination;

  // Callback Variable
  PackerinTempledestinationModel({required this.templedestination});

  // Convert Json to Local Variable
  factory PackerinTempledestinationModel.fromJson(Map<String, dynamic> json) =>
      PackerinTempledestinationModel(
          templedestination: List<PackerinTempledestinationListModel>.from(
              json["templedestination"]
                  .map((x) => PackerinTempledestinationListModel.fromJson(x))));

  // Mapping Local Variable
  Map<String, dynamic> toJson() =>
      {"templedestination": List<dynamic>.from(templedestination.map((x) => x.toJson()))};
}

// Decode Json
PackerinTempledestinationModel templedestinationFromJson(String str) =>
    PackerinTempledestinationModel.fromJson(json.decode(str));

// Encode Json
String templedestinationToJson(PackerinTempledestinationModel data) =>
    json.encode(data.toJson());

// Parse Json
List<PackerinTempledestinationListModel> parseTempledestination(String json) {
  final List parsed = jsonDecode(json)["templedestination"];
  return parsed
      .map((json) => PackerinTempledestinationListModel.fromJson(json))
      .toList();
}
