import '../entities/place.dart';

abstract class PlacesRepository {
  Future<List<Result>> fetchNearbyPlaces(double latitude, double longitude);
}
