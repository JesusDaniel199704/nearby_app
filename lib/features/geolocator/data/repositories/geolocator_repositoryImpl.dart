import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/domain/entities/Location.dart';
import 'package:nearby_app/features/geolocator/domain/repositories/geolocator_repository.dart';

class LocationRepositoryImpl implements GeolocatorRepository {
  @override
  Future<BitmapDescriptor> createMarkerFromAsset(String path) async {
    ImageConfiguration configuration = const ImageConfiguration();
    BitmapDescriptor descriptor =
        await BitmapDescriptor.fromAssetImage(configuration, path);
    return descriptor;
  }

  @override
  Marker getMarker(String markerId, double lat, double lng, String title,
      String content, Function() onTap) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
        markerId: id,
        onTap: onTap,
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: title));
    return marker;
  }

  @override
  Future<LocationAdress?> getPlacemarkData(
      CameraPosition cameraPosition) async {
    try {
      double lat = cameraPosition.target.latitude;
      double lng = cameraPosition.target.longitude;
      List<Placemark> placemarkList = await placemarkFromCoordinates(lat, lng);
      if (placemarkList.isNotEmpty) {
        String address = placemarkList[0].thoroughfare!;
        String street = placemarkList[0].subThoroughfare!;
        String city = placemarkList[0].locality!;
        String department = placemarkList[0].administrativeArea!;

        LocationAdress placemarkData = LocationAdress(
            address: '$address,$street, $city, $department',
            latitude: lat,
            longitude: lng);

        return placemarkData;
      }
    } catch (e) {
      print("Error geocodificación $e");
      return null;
    }
    return null;
  }

  @override
  Future<Position> findPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permissions are denied");

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Location permissions are permanently denied");
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
