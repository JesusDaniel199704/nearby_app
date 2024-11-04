import 'package:injectable/injectable.dart';
import 'package:nearby_app/features/foursquare/data/repositories/places_repository_impl.dart.dart';
import 'package:nearby_app/features/foursquare/domain/repositories/places_repository.dart';
import 'package:nearby_app/features/foursquare/domain/usecases/PlacesUseCase.dart';
import 'package:nearby_app/features/foursquare/domain/usecases/SearchPlacesUseCase.dart';
import 'package:nearby_app/features/foursquare/domain/usecases/nearbyPlacesUseCase.dart';
import 'package:nearby_app/features/geolocator/data/repositories/geolocator_repositoryImpl.dart'
    as repository;
import 'package:nearby_app/features/geolocator/domain/repositories/geolocator_repository.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/CreateMarkerUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCases.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GetMarkerUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GetPlacemarkDataUseCase.dart';

import '../features/geolocator/domain/useCases/getLocationUsecase.dart';

@module
abstract class Appmodule {
  @injectable
  GeolocatorRepository get locationRepository =>
      repository.LocationRepositoryImpl();

  @injectable
  PlacesRepository get placeRepository => PlacesRepositoryImpl();

  @injectable
  NearbyPlacesUseCase get nearbyPlacesUseCase =>
      NearbyPlacesUseCase(placeRepository);

  @injectable
  GeolocatorUseCases get geolocatorUseCase => GeolocatorUseCases(
        getPlacemarkData: GetPlacemarkDataUseCase(locationRepository),
        findPosition: FindPositionUseCase(locationRepository),
        createMarker: CreateMarkerUseCase(locationRepository),
        getMarker: GetMarkerUseCase(locationRepository),
      );

  @injectable
  PlacesUseCase get placesUseCase => PlacesUseCase(placeRepository);

  @injectable
  SearchPlacesUseCase get searchPlacesUseCase =>
      SearchPlacesUseCase(placeRepository);
}
