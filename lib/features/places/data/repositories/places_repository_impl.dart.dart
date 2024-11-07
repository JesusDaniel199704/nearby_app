import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nearby_app/api/ApiConfig.dart';
import '../../domain/entities/place.dart';
import '../../domain/repositories/places_repository.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final String nearby = 'https://api.foursquare.com/v3/places/nearby';

  @override
  Future<List<Result>> fetchNearbyPlaces(
      double latitude, double longitude) async {
    try {
      final response = await http.get(
        Uri.parse('$nearby?ll=$latitude,$longitude&hacc=10&limit=50'),
        headers: {
          'Authorization': ApiConfig.API_NEARBY,
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((json) => Result.fromJson(json)).toList();
      } else {
        throw Exception('Error load fetchNearbyPlace: ${response.statusCode}');
      }
    } catch (e) {
      return throw Exception('Error load fetchNearbyPlace: $e');
    }
  }
}
