class PackerinDestinationListModel {
  // Declarate Variables
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  String category;

  // Callback Variables
  PackerinDestinationListModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.category,
  });

  // Convert Json to Local Variable
  factory PackerinDestinationListModel.fromJson(Map<String, dynamic> json) {
    return PackerinDestinationListModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
      category: json['category'],
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
      'category': category,
    };
  }
}
