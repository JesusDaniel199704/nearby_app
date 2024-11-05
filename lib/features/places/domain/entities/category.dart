import 'package:nearby_app/features/places/domain/entities/photo.dart';

class Category {
  int id;
  String name;
  String shortName;
  String pluralName;
  Photo icon;

  Category({
    required this.id,
    required this.name,
    required this.shortName,
    required this.pluralName,
    required this.icon,
  });

  Category copyWith({
    int? id,
    String? name,
    String? shortName,
    String? pluralName,
    Photo? icon,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        shortName: shortName ?? this.shortName,
        pluralName: pluralName ?? this.pluralName,
        icon: icon ?? this.icon,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
        pluralName: json["plural_name"],
        icon: Photo.fromJson(json["icon"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
        "plural_name": pluralName,
        "icon": icon.toJson(),
      };
}
