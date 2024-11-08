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
import 'package:nearby_app/features/geolocator/domain/repositories/geolocator_repository.dart'
    as _i739;
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCase.dart'
    as _i692;
import 'package:nearby_app/features/places/domain/repositories/places_repository.dart'
    as _i1072;
import 'package:nearby_app/features/places/domain/usecases/NearbyPlacesUseCase.dart'
    as _i850;

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
    gh.factory<_i1072.PlacesRepository>(() => appmodule.placeRepository);
    gh.factory<_i850.NearbyPlacesUseCase>(() => appmodule.nearbyPlacesUseCase);
    gh.factory<_i692.GeolocatorUseCase>(() => appmodule.geolocatorUseCase);
    return this;
  }
}

class _$Appmodule extends _i298.Appmodule {}
