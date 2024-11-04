import 'package:nearby_app/features/foursquare/domain/entities/tips.dart';

class Photo {
  String id;
  DateTime createdAt;
  String prefix;
  String suffix;
  int width;
  int height;
  List<String> classifications;
  Tip tip;

  Photo({
    required this.id,
    required this.createdAt,
    required this.prefix,
    required this.suffix,
    required this.width,
    required this.height,
    required this.classifications,
    required this.tip,
  });

  Photo copyWith({
    String? id,
    DateTime? createdAt,
    String? prefix,
    String? suffix,
    int? width,
    int? height,
    List<String>? classifications,
    Tip? tip,
  }) =>
      Photo(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        prefix: prefix ?? this.prefix,
        suffix: suffix ?? this.suffix,
        width: width ?? this.width,
        height: height ?? this.height,
        classifications: classifications ?? this.classifications,
        tip: tip ?? this.tip,
      );

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        prefix: json["prefix"],
        suffix: json["suffix"],
        width: json["width"],
        height: json["height"],
        classifications:
            List<String>.from(json["classifications"].map((x) => x)),
        tip: Tip.fromJson(json["tip"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "prefix": prefix,
        "suffix": suffix,
        "width": width,
        "height": height,
        "classifications": List<dynamic>.from(classifications.map((x) => x)),
        "tip": tip.toJson(),
      };
}
