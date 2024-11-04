import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_app/features/foursquare/domain/usecases/PlacesUseCase.dart';
import 'package:nearby_app/features/foursquare/domain/usecases/SearchPlacesUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCases.dart';
import 'package:nearby_app/features/geolocator/presentation/bloc/Location_bloc.dart';
import 'package:nearby_app/injection.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LocationBloc>(
    create: (context) => LocationBloc(locator<GeolocatorUseCases>(),
        locator<PlacesUseCase>(), locator<SearchPlacesUseCase>()),
  ),
];
