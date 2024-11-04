import 'package:geolocator/geolocator.dart';
import 'package:nearby_app/features/geolocator/domain/entities/Location.dart';

class LocationModel {
  final double latitude;
  final double longitude;
  final String? address;
  LocationModel(
      {required this.latitude, required this.longitude, this.address});

  factory LocationModel.fromPosition(Position position) {
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
  LocationAdress toEntity() {
    return LocationAdress(
        latitude: latitude, longitude: longitude, address: address ?? '');
  }
}
