import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/geolocator/domain/repositories/location_repository.dart';

class GetPlacemarkDataUseCase {
  LocationRepository geolocatorRepository;

  GetPlacemarkDataUseCase(this.geolocatorRepository);

  run(CameraPosition cameraPosition) =>
      geolocatorRepository.getPlacemarkData(cameraPosition);
}
