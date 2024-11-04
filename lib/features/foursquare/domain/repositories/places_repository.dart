import '../entities/place.dart';

abstract class PlacesRepository {
  Future<List<Place>> places(String query, double lat, double lng);
  Future<List<Place>> searchPlaces(String query);
}
