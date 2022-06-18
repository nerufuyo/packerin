class PackerinCitydestinationListModel {
  // Declarate Variables
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  // Callback Variables
  PackerinCitydestinationListModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  // Convert Json to Local Variable
  factory PackerinCitydestinationListModel.fromJson(Map<String, dynamic> json) {
    return PackerinCitydestinationListModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
    );
  }

  // Mapping Local Variable
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': rating,
    };
  }
}
