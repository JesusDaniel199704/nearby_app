import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/domain/repositories/geolocator_repository.dart';

class LocationRepositoryImpl implements GeolocatorRepository {
  @override
  Marker getMarker(String markerId, double lat, double lng, String title,
      String content, Function() onTap) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
        markerId: id,
        onTap: onTap,
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: title, snippet: content));
    return marker;
  }

  @override
  Future<Position> findPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
