import 'package:nearby_app/features/places/domain/entities/amenitis.dart';
import 'package:nearby_app/features/places/domain/entities/atributes.dart';
import 'package:nearby_app/features/places/domain/entities/foodanddrink.dart';
import 'package:nearby_app/features/places/domain/entities/payment.dart';
import 'package:nearby_app/features/places/domain/entities/services.dart';

class Features {
  Payment payment;
  FoodAndDrink foodAndDrink;
  Services services;
  Amenities amenities;
  Attributes attributes;

  Features({
    required this.payment,
    required this.foodAndDrink,
    required this.services,
    required this.amenities,
    required this.attributes,
  });

  Features copyWith({
    Payment? payment,
    FoodAndDrink? foodAndDrink,
    Services? services,
    Amenities? amenities,
    Attributes? attributes,
  }) =>
      Features(
        payment: payment ?? this.payment,
        foodAndDrink: foodAndDrink ?? this.foodAndDrink,
        services: services ?? this.services,
        amenities: amenities ?? this.amenities,
        attributes: attributes ?? this.attributes,
      );

  factory Features.fromJson(Map<String, dynamic> json) => Features(
        payment: Payment.fromJson(json["payment"]),
        foodAndDrink: FoodAndDrink.fromJson(json["food_and_drink"]),
        services: Services.fromJson(json["services"]),
        amenities: Amenities.fromJson(json["amenities"]),
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "payment": payment.toJson(),
        "food_and_drink": foodAndDrink.toJson(),
        "services": services.toJson(),
        "amenities": amenities.toJson(),
        "attributes": attributes.toJson(),
      };
}
