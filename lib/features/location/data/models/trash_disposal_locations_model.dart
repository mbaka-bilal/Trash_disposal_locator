import 'package:collection/collection.dart';

class DisposalLocation {
  final int? id;
  final Location? location;
  final String? address;
  final List<String>? pictures;
  final DateTime? createdAt;

  DisposalLocation({
    this.id,
    this.location,
    this.address,
    this.pictures,
    this.createdAt,
  });

  factory DisposalLocation.fromJson(Map<String, dynamic> json) {
    return DisposalLocation(
      id: json['id'],
      location: json['location'] != null ? Location.fromJson(json['location']) : null,
      address: json['address'],
      pictures: (json['pictures'] as List<dynamic>?)?.cast<String>(),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location?.toJson(),
      'address': address,
      'pictures': pictures,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  DisposalLocation copyWith({
    int? id,
    Location? location,
    String? address,
    List<String>? pictures,
    DateTime? createdAt,
  }) {
    return DisposalLocation(
      id: id ?? this.id,
      location: location ?? this.location,
      address: address ?? this.address,
      pictures: pictures ?? this.pictures,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DisposalLocation &&
        other.id == id &&
        other.location == location &&
        other.address == address &&
        ListEquality().equals(other.pictures, pictures) &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        location.hashCode ^
        address.hashCode ^
        pictures.hashCode ^
        createdAt.hashCode;
  }
}

class Location {
  final double? lat;
  final double? lng;

  Location({this.lat, this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  Location copyWith({
    double? lat,
    double? lng,
  }) {
    return Location(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location &&
        other.lat == lat &&
        other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
