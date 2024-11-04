// import 'package:nearby_app/features/foursquare/domain/entities/place.dart';

// class Geocodes {
//   Center dropOff;
//   Center frontDoor;
//   Center main;
//   Center road;
//   Center roof;

//   Geocodes({
//     required this.dropOff,
//     required this.frontDoor,
//     required this.main,
//     required this.road,
//     required this.roof,
//   });

//   Geocodes copyWith({
//     Center? dropOff,
//     Center? frontDoor,
//     Center? main,
//     Center? road,
//     Center? roof,
//   }) =>
//       Geocodes(
//         dropOff: dropOff ?? this.dropOff,
//         frontDoor: frontDoor ?? this.frontDoor,
//         main: main ?? this.main,
//         road: road ?? this.road,
//         roof: roof ?? this.roof,
//       );

//   factory Geocodes.fromJson(Map<String, dynamic> json) => Geocodes(
//         dropOff: Center.fromJson(json["drop_off"]),
//         frontDoor: Center.fromJson(json["front_door"]),
//         main: Center.fromJson(json["main"]),
//         road: Center.fromJson(json["road"]),
//         roof: Center.fromJson(json["roof"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "drop_off": dropOff.toJson(),
//         "front_door": frontDoor.toJson(),
//         "main": main.toJson(),
//         "road": road.toJson(),
//         "roof": roof.toJson(),
//       };
// }
