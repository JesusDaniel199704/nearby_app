import '../entities/place.dart';

abstract class PlacesRepository {
  Future<List<Result>> searchPlaces(
      String query, double latitude, double longitude);
  Future<List<Result>> fetchNearbyPlaces(double latitude, double longitude);
}
