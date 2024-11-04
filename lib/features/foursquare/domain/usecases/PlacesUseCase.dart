import 'package:nearby_app/features/foursquare/domain/repositories/places_repository.dart';

class PlacesUseCase {
  final PlacesRepository repository;

  PlacesUseCase(this.repository);

  run() => repository.places();
}
