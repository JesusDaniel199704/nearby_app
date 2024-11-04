import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nearby_app/api/ApiConfig.dart';
import '../../domain/entities/place.dart';
import '../../domain/repositories/places_repository.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final String _baseUrl = "https://api.foursquare.com/v3/places/search";

  @override
  Future<List<Place>> places() async {
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

  Future<void> fetchNearbyPlaces(double latitude, double longitude) async {
    final String url = 'https://api.foursquare.com/v3/places/nearby';

    final response = await http.get(
      Uri.parse('$url?ll=$latitude,$longitude&radius=1000'),
      headers: {
        'Authorization': ApiConfig.API_NEARBY,
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print("Datastester $data");
    } else {
      throw Exception(
          'Error al cargar lugares cercanos: ${response.statusCode}');
    }
  }
}
