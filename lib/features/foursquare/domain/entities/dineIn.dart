import 'package:nearby_app/features/foursquare/domain/entities/relatedPlaces.dart';

class DineIn {
  RelatedPlaces reservations;
  RelatedPlaces onlineReservations;
  RelatedPlaces groupsOnlyReservations;
  RelatedPlaces essentialReservations;

  DineIn({
    required this.reservations,
    required this.onlineReservations,
    required this.groupsOnlyReservations,
    required this.essentialReservations,
  });

  DineIn copyWith({
    RelatedPlaces? reservations,
    RelatedPlaces? onlineReservations,
    RelatedPlaces? groupsOnlyReservations,
    RelatedPlaces? essentialReservations,
  }) =>
      DineIn(
        reservations: reservations ?? this.reservations,
        onlineReservations: onlineReservations ?? this.onlineReservations,
        groupsOnlyReservations:
            groupsOnlyReservations ?? this.groupsOnlyReservations,
        essentialReservations:
            essentialReservations ?? this.essentialReservations,
      );

  factory DineIn.fromJson(Map<String, dynamic> json) => DineIn(
        reservations: RelatedPlaces.fromJson(json["reservations"]),
        onlineReservations: RelatedPlaces.fromJson(json["online_reservations"]),
        groupsOnlyReservations:
            RelatedPlaces.fromJson(json["groups_only_reservations"]),
        essentialReservations:
            RelatedPlaces.fromJson(json["essential_reservations"]),
      );

  Map<String, dynamic> toJson() => {
        "reservations": reservations.toJson(),
        "online_reservations": onlineReservations.toJson(),
        "groups_only_reservations": groupsOnlyReservations.toJson(),
        "essential_reservations": essentialReservations.toJson(),
      };
}
