import 'package:nearby_app/features/foursquare/domain/entities/relatedPlaces.dart';

class Parking {
  RelatedPlaces parking;
  RelatedPlaces streetParking;
  RelatedPlaces valetParking;
  RelatedPlaces publicLot;
  RelatedPlaces privateLot;

  Parking({
    required this.parking,
    required this.streetParking,
    required this.valetParking,
    required this.publicLot,
    required this.privateLot,
  });

  Parking copyWith({
    RelatedPlaces? parking,
    RelatedPlaces? streetParking,
    RelatedPlaces? valetParking,
    RelatedPlaces? publicLot,
    RelatedPlaces? privateLot,
  }) =>
      Parking(
        parking: parking ?? this.parking,
        streetParking: streetParking ?? this.streetParking,
        valetParking: valetParking ?? this.valetParking,
        publicLot: publicLot ?? this.publicLot,
        privateLot: privateLot ?? this.privateLot,
      );

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        parking: RelatedPlaces.fromJson(json["parking"]),
        streetParking: RelatedPlaces.fromJson(json["street_parking"]),
        valetParking: RelatedPlaces.fromJson(json["valet_parking"]),
        publicLot: RelatedPlaces.fromJson(json["public_lot"]),
        privateLot: RelatedPlaces.fromJson(json["private_lot"]),
      );

  Map<String, dynamic> toJson() => {
        "parking": parking.toJson(),
        "street_parking": streetParking.toJson(),
        "valet_parking": valetParking.toJson(),
        "public_lot": publicLot.toJson(),
        "private_lot": privateLot.toJson(),
      };
}
