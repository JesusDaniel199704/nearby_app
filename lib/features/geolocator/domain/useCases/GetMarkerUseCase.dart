import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/domain/repositories/geolocator_repository.dart';

class GetMarkerUseCase {
  GeolocatorRepository geolocatorRepository;
  GetMarkerUseCase(this.geolocatorRepository);

  run(String markerId, double lat, double lng, String title, String content,
          Function() onTap) =>
      geolocatorRepository.getMarker(markerId, lat, lng, title, content, onTap);
}
