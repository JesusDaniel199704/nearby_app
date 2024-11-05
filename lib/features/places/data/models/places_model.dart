import 'package:nearby_app/features/places/domain/entities/place.dart';

class PlaceModel extends Result {
  final String id;
  final String name;
  final String address;

  PlaceModel({
    required this.id,
    required this.name,
    required this.address,
  }) : super(fsqId: id, name: name, description: address);

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['id'],
      name: json['name'],
      address: json['location']['address'] ?? '',
    );
  }
}
