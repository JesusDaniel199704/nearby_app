import 'package:nearby_app/features/foursquare/domain/repositories/places_repository.dart';

class SearchPlacesUseCase {
  final PlacesRepository repository;

  SearchPlacesUseCase(this.repository);

  run(String query) => repository.searchPlaces(query);
}
