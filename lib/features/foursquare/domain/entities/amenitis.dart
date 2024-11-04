import 'package:nearby_app/features/foursquare/domain/entities/parking.dart';
import 'package:nearby_app/features/foursquare/domain/entities/relatedPlaces.dart';

class Amenities {
  RelatedPlaces restroom;
  RelatedPlaces smoking;
  RelatedPlaces jukebox;
  RelatedPlaces music;
  RelatedPlaces liveMusic;
  RelatedPlaces privateRoom;
  RelatedPlaces outdoorSeating;
  RelatedPlaces tvs;
  RelatedPlaces atm;
  RelatedPlaces coatCheck;
  RelatedPlaces wheelchairAccessible;
  Parking parking;
  RelatedPlaces sitDownDining;
  String wifi;

  Amenities({
    required this.restroom,
    required this.smoking,
    required this.jukebox,
    required this.music,
    required this.liveMusic,
    required this.privateRoom,
    required this.outdoorSeating,
    required this.tvs,
    required this.atm,
    required this.coatCheck,
    required this.wheelchairAccessible,
    required this.parking,
    required this.sitDownDining,
    required this.wifi,
  });

  Amenities copyWith({
    RelatedPlaces? restroom,
    RelatedPlaces? smoking,
    RelatedPlaces? jukebox,
    RelatedPlaces? music,
    RelatedPlaces? liveMusic,
    RelatedPlaces? privateRoom,
    RelatedPlaces? outdoorSeating,
    RelatedPlaces? tvs,
    RelatedPlaces? atm,
    RelatedPlaces? coatCheck,
    RelatedPlaces? wheelchairAccessible,
    Parking? parking,
    RelatedPlaces? sitDownDining,
    String? wifi,
  }) =>
      Amenities(
        restroom: restroom ?? this.restroom,
        smoking: smoking ?? this.smoking,
        jukebox: jukebox ?? this.jukebox,
        music: music ?? this.music,
        liveMusic: liveMusic ?? this.liveMusic,
        privateRoom: privateRoom ?? this.privateRoom,
        outdoorSeating: outdoorSeating ?? this.outdoorSeating,
        tvs: tvs ?? this.tvs,
        atm: atm ?? this.atm,
        coatCheck: coatCheck ?? this.coatCheck,
        wheelchairAccessible: wheelchairAccessible ?? this.wheelchairAccessible,
        parking: parking ?? this.parking,
        sitDownDining: sitDownDining ?? this.sitDownDining,
        wifi: wifi ?? this.wifi,
      );

  factory Amenities.fromJson(Map<String, dynamic> json) => Amenities(
        restroom: RelatedPlaces.fromJson(json["restroom"]),
        smoking: RelatedPlaces.fromJson(json["smoking"]),
        jukebox: RelatedPlaces.fromJson(json["jukebox"]),
        music: RelatedPlaces.fromJson(json["music"]),
        liveMusic: RelatedPlaces.fromJson(json["live_music"]),
        privateRoom: RelatedPlaces.fromJson(json["private_room"]),
        outdoorSeating: RelatedPlaces.fromJson(json["outdoor_seating"]),
        tvs: RelatedPlaces.fromJson(json["tvs"]),
        atm: RelatedPlaces.fromJson(json["atm"]),
        coatCheck: RelatedPlaces.fromJson(json["coat_check"]),
        wheelchairAccessible:
            RelatedPlaces.fromJson(json["wheelchair_accessible"]),
        parking: Parking.fromJson(json["parking"]),
        sitDownDining: RelatedPlaces.fromJson(json["sit_down_dining"]),
        wifi: json["wifi"],
      );

  Map<String, dynamic> toJson() => {
        "restroom": restroom.toJson(),
        "smoking": smoking.toJson(),
        "jukebox": jukebox.toJson(),
        "music": music.toJson(),
        "live_music": liveMusic.toJson(),
        "private_room": privateRoom.toJson(),
        "outdoor_seating": outdoorSeating.toJson(),
        "tvs": tvs.toJson(),
        "atm": atm.toJson(),
        "coat_check": coatCheck.toJson(),
        "wheelchair_accessible": wheelchairAccessible.toJson(),
        "parking": parking.toJson(),
        "sit_down_dining": sitDownDining.toJson(),
        "wifi": wifi,
      };
}
