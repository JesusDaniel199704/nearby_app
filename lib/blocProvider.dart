import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCase.dart';
import 'package:nearby_app/features/geolocator/presentation/bloc/Geolocator_bloc.dart';
import 'package:nearby_app/features/places/domain/usecases/SearchPlacesUseCase.dart';
import 'package:nearby_app/features/places/domain/usecases/NearbyPlacesUseCase.dart';
import 'package:nearby_app/injection.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<GeolocatorBloc>(
    create: (context) => GeolocatorBloc(
      locator<GeolocatorUseCase>(),
      locator<SearchPlacesUseCase>(),
      locator<NearbyPlacesUseCase>(),
    )..add(LocationInitEvent()),
  )
];
