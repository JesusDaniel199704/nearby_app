import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/domain/repositories/location_repository.dart';

class GetMarkerUseCase {
  LocationRepository geolocatorRepository;
  GetMarkerUseCase(this.geolocatorRepository);

  run(String markerId, double lat, double lng, String title, String content,
          BitmapDescriptor imageMarker) =>
      geolocatorRepository.getMarker(
          markerId, lat, lng, title, content, imageMarker);
}
