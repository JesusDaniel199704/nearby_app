import 'package:nearby_app/features/geolocator/domain/repositories/location_repository.dart';

class CreateMarkerUseCase {
  LocationRepository geolocatorRepository;
  CreateMarkerUseCase(this.geolocatorRepository);

  run(String path) => geolocatorRepository.createMarkerFromAsset(path);
}
