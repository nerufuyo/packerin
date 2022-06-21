import 'package:cloud_firestore/cloud_firestore.dart';

class PackerinDestination {
  // Declarate Variables
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  String category;

  // Callback Variables
  PackerinDestination({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.category,
  });

  // Convert map to Local Variable
  factory PackerinDestination.fromMap(map) {
    return PackerinDestination(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      pictureId: map['pictureId'],
      city: map['city'],
      rating: map['rating'].toDouble(),
      category: map['category'],
    );
  }

  // Mapping Local Variable
  Map<String, dynamic> tomap() {
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

  destination(DocumentSnapshot<Object?> map) {
    return PackerinDestination.fromMap(map);
  }
}
