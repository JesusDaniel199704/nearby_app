import 'package:nearby_app/features/foursquare/domain/repositories/places_repository.dart';

class PlacesUseCase {
  final PlacesRepository repository;

  PlacesUseCase(this.repository);

  run(String query, double lat, double lng) =>
      repository.places(query, lat, lng);
}
