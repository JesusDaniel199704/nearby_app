import 'package:nearby_app/features/geolocator/domain/repositories/geolocator_repository.dart';

class CreateMarkerUseCase {
  GeolocatorRepository geolocatorRepository;
  CreateMarkerUseCase(this.geolocatorRepository);

  run(String path) => geolocatorRepository.createMarkerFromAsset(path);
}
