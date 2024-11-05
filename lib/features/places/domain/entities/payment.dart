import 'package:nearby_app/features/places/domain/entities/digitalwallet.dart';
import 'package:nearby_app/features/places/domain/entities/relatedPlaces.dart';

class Payment {
  CreditCards creditCards;
  DigitalWallet digitalWallet;

  Payment({
    required this.creditCards,
    required this.digitalWallet,
  });

  Payment copyWith({
    CreditCards? creditCards,
    DigitalWallet? digitalWallet,
  }) =>
      Payment(
        creditCards: creditCards ?? this.creditCards,
        digitalWallet: digitalWallet ?? this.digitalWallet,
      );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        creditCards: CreditCards.fromJson(json["credit_cards"]),
        digitalWallet: DigitalWallet.fromJson(json["digital_wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "credit_cards": creditCards.toJson(),
        "digital_wallet": digitalWallet.toJson(),
      };
}

class CreditCards {
  RelatedPlaces acceptsCreditCards;
  RelatedPlaces amex;
  RelatedPlaces discover;
  RelatedPlaces visa;
  RelatedPlaces dinersClub;
  RelatedPlaces masterCard;
  RelatedPlaces unionPay;

  CreditCards({
    required this.acceptsCreditCards,
    required this.amex,
    required this.discover,
    required this.visa,
    required this.dinersClub,
    required this.masterCard,
    required this.unionPay,
  });

  CreditCards copyWith({
    RelatedPlaces? acceptsCreditCards,
    RelatedPlaces? amex,
    RelatedPlaces? discover,
    RelatedPlaces? visa,
    RelatedPlaces? dinersClub,
    RelatedPlaces? masterCard,
    RelatedPlaces? unionPay,
  }) =>
      CreditCards(
        acceptsCreditCards: acceptsCreditCards ?? this.acceptsCreditCards,
        amex: amex ?? this.amex,
        discover: discover ?? this.discover,
        visa: visa ?? this.visa,
        dinersClub: dinersClub ?? this.dinersClub,
        masterCard: masterCard ?? this.masterCard,
        unionPay: unionPay ?? this.unionPay,
      );

  factory CreditCards.fromJson(Map<String, dynamic> json) => CreditCards(
        acceptsCreditCards:
            RelatedPlaces.fromJson(json["accepts_credit_cards"]),
        amex: RelatedPlaces.fromJson(json["amex"]),
        discover: RelatedPlaces.fromJson(json["discover"]),
        visa: RelatedPlaces.fromJson(json["visa"]),
        dinersClub: RelatedPlaces.fromJson(json["diners_club"]),
        masterCard: RelatedPlaces.fromJson(json["master_card"]),
        unionPay: RelatedPlaces.fromJson(json["union_pay"]),
      );

  Map<String, dynamic> toJson() => {
        "accepts_credit_cards": acceptsCreditCards.toJson(),
        "amex": amex.toJson(),
        "discover": discover.toJson(),
        "visa": visa.toJson(),
        "diners_club": dinersClub.toJson(),
        "master_card": masterCard.toJson(),
        "union_pay": unionPay.toJson(),
      };
}
