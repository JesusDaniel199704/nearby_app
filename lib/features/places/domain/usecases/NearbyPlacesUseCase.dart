import 'package:nearby_app/features/places/domain/repositories/places_repository.dart';

class NearbyPlacesUseCase {
  final PlacesRepository placesRepository;

  NearbyPlacesUseCase(this.placesRepository);

  run(double latitude, double longitud) =>
      placesRepository.fetchNearbyPlaces(latitude, longitud);
}
