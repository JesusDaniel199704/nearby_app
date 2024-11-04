import 'package:nearby_app/features/geolocator/domain/repositories/location_repository.dart';

class FindPositionUseCase {
  final LocationRepository repository;

  FindPositionUseCase(this.repository);

  run() => repository.findPosition();
}
