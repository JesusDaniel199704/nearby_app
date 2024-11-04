// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nearby_app/di/AppModule.dart' as _i298;
import 'package:nearby_app/features/foursquare/domain/repositories/places_repository.dart'
    as _i337;
import 'package:nearby_app/features/foursquare/domain/usecases/nearbyPlacesUseCase.dart'
    as _i419;
import 'package:nearby_app/features/foursquare/domain/usecases/PlacesUseCase.dart'
    as _i111;
import 'package:nearby_app/features/foursquare/domain/usecases/SearchPlacesUseCase.dart'
    as _i1019;
import 'package:nearby_app/features/geolocator/domain/repositories/geolocator_repository.dart'
    as _i739;
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCases.dart'
    as _i252;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appmodule = _$Appmodule();
    gh.factory<_i739.GeolocatorRepository>(() => appmodule.locationRepository);
    gh.factory<_i337.PlacesRepository>(() => appmodule.placeRepository);
    gh.factory<_i419.NearbyPlacesUseCase>(() => appmodule.nearbyPlacesUseCase);
    gh.factory<_i252.GeolocatorUseCases>(() => appmodule.geolocatorUseCase);
    gh.factory<_i111.PlacesUseCase>(() => appmodule.placesUseCase);
    gh.factory<_i1019.SearchPlacesUseCase>(() => appmodule.searchPlacesUseCase);
    return this;
  }
}

class _$Appmodule extends _i298.Appmodule {}
