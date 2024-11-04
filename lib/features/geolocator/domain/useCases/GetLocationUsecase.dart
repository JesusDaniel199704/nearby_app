import 'package:nearby_app/features/geolocator/domain/repositories/geolocator_repository.dart';

class FindPositionUseCase {
  final GeolocatorRepository geolocatorRepository;

  FindPositionUseCase(this.geolocatorRepository);

  run() => geolocatorRepository.findPosition();
}
