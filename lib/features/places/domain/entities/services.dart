import 'package:nearby_app/features/places/domain/entities/dineIn.dart';
import 'package:nearby_app/features/places/domain/entities/relatedPlaces.dart';

class Services {
  RelatedPlaces delivery;
  RelatedPlaces takeout;
  RelatedPlaces driveThrough;
  DineIn dineIn;

  Services({
    required this.delivery,
    required this.takeout,
    required this.driveThrough,
    required this.dineIn,
  });

  Services copyWith({
    RelatedPlaces? delivery,
    RelatedPlaces? takeout,
    RelatedPlaces? driveThrough,
    DineIn? dineIn,
  }) =>
      Services(
        delivery: delivery ?? this.delivery,
        takeout: takeout ?? this.takeout,
        driveThrough: driveThrough ?? this.driveThrough,
        dineIn: dineIn ?? this.dineIn,
      );

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        delivery: RelatedPlaces.fromJson(json["delivery"]),
        takeout: RelatedPlaces.fromJson(json["takeout"]),
        driveThrough: RelatedPlaces.fromJson(json["drive_through"]),
        dineIn: DineIn.fromJson(json["dine_in"]),
      );

  Map<String, dynamic> toJson() => {
        "delivery": delivery.toJson(),
        "takeout": takeout.toJson(),
        "drive_through": driveThrough.toJson(),
        "dine_in": dineIn.toJson(),
      };
}
