import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nearby_app/api/ApiConfig.dart';
import '../../domain/entities/place.dart';
import '../../domain/repositories/places_repository.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final String baseUrl = "https://api.foursquare.com/v3/places/search";
  final String nearby = 'https://api.foursquare.com/v3/places/nearby';

  @override
  Future<List<Result>> searchPlaces(
      String query, double latitude, double longitude) async {
    final response = await http.get(
      Uri.parse("$nearby?ll=$latitude,$longitude&radius=1000?query=$query"),
      headers: {
        "Accept": "application/json",
        "Authorization": ApiConfig.API_NEARBY,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Result.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search places');
    }
  }

  @override
  Future<List<Result>> fetchNearbyPlaces(
      double latitude, double longitude) async {
    const String url = 'https://api.foursquare.com/v3/places/nearby';
    try {
      final response = await http.get(
        Uri.parse('$url?ll=$latitude,$longitude&radius=1000'),
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
      return throw Exception('Error load fetchNearbyPlace: ${e}');
    }
  }
}
