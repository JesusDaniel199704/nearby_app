import 'package:nearby_app/features/places/domain/entities/relatedPlaces.dart';

class Alcohol {
  RelatedPlaces barService;
  RelatedPlaces beer;
  RelatedPlaces byo;
  RelatedPlaces cocktails;
  RelatedPlaces fullBar;
  RelatedPlaces wine;

  Alcohol({
    required this.barService,
    required this.beer,
    required this.byo,
    required this.cocktails,
    required this.fullBar,
    required this.wine,
  });

  Alcohol copyWith({
    RelatedPlaces? barService,
    RelatedPlaces? beer,
    RelatedPlaces? byo,
    RelatedPlaces? cocktails,
    RelatedPlaces? fullBar,
    RelatedPlaces? wine,
  }) =>
      Alcohol(
        barService: barService ?? this.barService,
        beer: beer ?? this.beer,
        byo: byo ?? this.byo,
        cocktails: cocktails ?? this.cocktails,
        fullBar: fullBar ?? this.fullBar,
        wine: wine ?? this.wine,
      );

  factory Alcohol.fromJson(Map<String, dynamic> json) => Alcohol(
        barService: RelatedPlaces.fromJson(json["bar_service"]),
        beer: RelatedPlaces.fromJson(json["beer"]),
        byo: RelatedPlaces.fromJson(json["byo"]),
        cocktails: RelatedPlaces.fromJson(json["cocktails"]),
        fullBar: RelatedPlaces.fromJson(json["full_bar"]),
        wine: RelatedPlaces.fromJson(json["wine"]),
      );

  Map<String, dynamic> toJson() => {
        "bar_service": barService.toJson(),
        "beer": beer.toJson(),
        "byo": byo.toJson(),
        "cocktails": cocktails.toJson(),
        "full_bar": fullBar.toJson(),
        "wine": wine.toJson(),
      };
}
