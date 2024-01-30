

import 'models.dart';

class Barrio extends BaseModel {
  String cuidadId;
  String name;
  String? description;
  double? latitude;
  double? longitude;
  List<Review> reviews;
  List<Amenity> amenities;

  Place({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required this.cuidadId,
    required this.userId,
    required this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.reviews = const [],
    this.amenities = const [],
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  Place.fromJson(Map<String, dynamic> json)
      : cityId = json['city_id'] ?? '',
        userId = json['user_id'] ?? '',
        name = json['name'] ?? '',
        latitude = json['latitude']?.toDouble(),
        longitude = json['longitude']?.toDouble(),
        reviews = (json['reviews'] as List<dynamic>?)
            ?.map((reviewJson) => Review.fromJson(reviewJson))
            .toList() ?? [],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'city_id': cityId,
      'user_id': userId,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'amenities': amenities.map((amenity) => amenity.toJson()).toList(),
    });
    return json;
  }

  @override
  String toString() {
    return 'Barrio{
      id: $id, 
      cuidadId: $cityId,
      userId: $userId, 
      trabajador: $trabajador, 
      latitude: $latitude, 
      longitude: $longitude, 
      'reviews: $reviews, '
      amenities: $amenities}';
  }

  // Additional Dart code for non-DB version
  List<Review> getReviews() {
    return reviews;
  }

  List<Amenity> getAmenities() {
    return amenities;
  }
}

class Review {
  // Implement Review class if not already defined
}

class Amenity {
  // Implement Amenity class if not already defined
}
