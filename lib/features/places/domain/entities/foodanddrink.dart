import 'package:nearby_app/features/places/domain/entities/alcohol.dart';
import 'package:nearby_app/features/places/domain/entities/meals.dart';

class FoodAndDrink {
  Alcohol alcohol;
  Meals meals;

  FoodAndDrink({
    required this.alcohol,
    required this.meals,
  });

  FoodAndDrink copyWith({
    Alcohol? alcohol,
    Meals? meals,
  }) =>
      FoodAndDrink(
        alcohol: alcohol ?? this.alcohol,
        meals: meals ?? this.meals,
      );

  factory FoodAndDrink.fromJson(Map<String, dynamic> json) => FoodAndDrink(
        alcohol: Alcohol.fromJson(json["alcohol"]),
        meals: Meals.fromJson(json["meals"]),
      );

  Map<String, dynamic> toJson() => {
        "alcohol": alcohol.toJson(),
        "meals": meals.toJson(),
      };
}
