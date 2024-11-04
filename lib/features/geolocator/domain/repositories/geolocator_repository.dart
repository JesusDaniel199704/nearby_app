import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/domain/entities/Location.dart';

abstract class GeolocatorRepository {
  Future<Position> findPosition();

  Future<BitmapDescriptor> createMarkerFromAsset(String path);

  Marker getMarker(String markerId, double lat, double lng, String title,
      String content, Function() onTap);

  Future<LocationAdress?> getPlacemarkData(CameraPosition cameraPosition);
}
