import 'package:injectable/injectable.dart';
import 'package:nearby_app/features/places/data/repositories/places_repository_impl.dart.dart';
import 'package:nearby_app/features/places/domain/repositories/places_repository.dart';
import 'package:nearby_app/features/places/domain/usecases/SearchPlacesUseCase.dart';
import 'package:nearby_app/features/places/domain/usecases/NearbyPlacesUseCase.dart';
import 'package:nearby_app/features/geolocator/data/repositories/geolocator_repositoryImpl.dart'
    as repository;
import 'package:nearby_app/features/geolocator/domain/repositories/geolocator_repository.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GetMarkerUseCase.dart';

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
  GeolocatorUseCase get geolocatorUseCase => GeolocatorUseCase(
        findPosition: FindPositionUseCase(locationRepository),
        getMarker: GetMarkerUseCase(locationRepository),
      );

  @injectable
  SearchPlacesUseCase get searchPlacesUseCase =>
      SearchPlacesUseCase(placeRepository);
}
