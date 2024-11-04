import '../entities/place.dart';

abstract class PlacesRepository {
  Future<List<Place>> places();
  Future<List<Place>> searchPlaces(String query);
  Future<void> fetchNearbyPlaces(double latitude, double longitude);
}
