import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nearby_app/api/ApiConfig.dart';
import '../../domain/entities/place.dart';
import '../../domain/repositories/places_repository.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final String _baseUrl = "https://api.foursquare.com/v3/places/search";

  @override
  Future<List<Place>> places(String query, double lat, double lng) async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        "Accept": "application/json",
        "Authorization": ApiConfig.API_NEARBY,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("places ${response.body}");
      final List<dynamic> results = data['results'];
      return results.map((json) => Place.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Future<List<Place>> searchPlaces(String query) async {
    print("query ${query}");
    final response = await http.get(
      Uri.parse("$_baseUrl?query=$query"),
      headers: {
        "Accept": "application/json",
        "Authorization": ApiConfig.API_NEARBY,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print("places ${response.body}");
      final List<dynamic> results = data['results'];
      return results.map((json) => Place.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }
}
