import 'package:nearby_app/features/places/domain/repositories/places_repository.dart';

class SearchPlacesUseCase {
  final PlacesRepository repository;

  SearchPlacesUseCase(this.repository);

  run(String query, double latitude, double longitude) =>
      repository.searchPlaces(query, latitude, longitude);
}
