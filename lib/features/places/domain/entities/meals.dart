import 'package:nearby_app/features/places/domain/entities/relatedPlaces.dart';

class Meals {
  RelatedPlaces barSnacks;
  RelatedPlaces breakfast;
  RelatedPlaces brunch;
  RelatedPlaces lunch;
  RelatedPlaces happyHour;
  RelatedPlaces dessert;
  RelatedPlaces dinner;
  RelatedPlaces tastingMenu;

  Meals({
    required this.barSnacks,
    required this.breakfast,
    required this.brunch,
    required this.lunch,
    required this.happyHour,
    required this.dessert,
    required this.dinner,
    required this.tastingMenu,
  });

  Meals copyWith({
    RelatedPlaces? barSnacks,
    RelatedPlaces? breakfast,
    RelatedPlaces? brunch,
    RelatedPlaces? lunch,
    RelatedPlaces? happyHour,
    RelatedPlaces? dessert,
    RelatedPlaces? dinner,
    RelatedPlaces? tastingMenu,
  }) =>
      Meals(
        barSnacks: barSnacks ?? this.barSnacks,
        breakfast: breakfast ?? this.breakfast,
        brunch: brunch ?? this.brunch,
        lunch: lunch ?? this.lunch,
        happyHour: happyHour ?? this.happyHour,
        dessert: dessert ?? this.dessert,
        dinner: dinner ?? this.dinner,
        tastingMenu: tastingMenu ?? this.tastingMenu,
      );

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        barSnacks: RelatedPlaces.fromJson(json["bar_snacks"]),
        breakfast: RelatedPlaces.fromJson(json["breakfast"]),
        brunch: RelatedPlaces.fromJson(json["brunch"]),
        lunch: RelatedPlaces.fromJson(json["lunch"]),
        happyHour: RelatedPlaces.fromJson(json["happy_hour"]),
        dessert: RelatedPlaces.fromJson(json["dessert"]),
        dinner: RelatedPlaces.fromJson(json["dinner"]),
        tastingMenu: RelatedPlaces.fromJson(json["tasting_menu"]),
      );

  Map<String, dynamic> toJson() => {
        "bar_snacks": barSnacks.toJson(),
        "breakfast": breakfast.toJson(),
        "brunch": brunch.toJson(),
        "lunch": lunch.toJson(),
        "happy_hour": happyHour.toJson(),
        "dessert": dessert.toJson(),
        "dinner": dinner.toJson(),
        "tasting_menu": tastingMenu.toJson(),
      };
}
