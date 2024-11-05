import 'package:nearby_app/features/places/domain/entities/relatedPlaces.dart';

class DigitalWallet {
  RelatedPlaces acceptsNfc;

  DigitalWallet({
    required this.acceptsNfc,
  });

  DigitalWallet copyWith({
    RelatedPlaces? acceptsNfc,
  }) =>
      DigitalWallet(
        acceptsNfc: acceptsNfc ?? this.acceptsNfc,
      );

  factory DigitalWallet.fromJson(Map<String, dynamic> json) => DigitalWallet(
        acceptsNfc: RelatedPlaces.fromJson(json["accepts_nfc"]),
      );

  Map<String, dynamic> toJson() => {
        "accepts_nfc": acceptsNfc.toJson(),
      };
}
