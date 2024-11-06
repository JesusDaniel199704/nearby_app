import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/places/domain/entities/place.dart';
import 'package:nearby_app/features/places/domain/usecases/SearchPlacesUseCase.dart';
import 'package:nearby_app/features/places/domain/usecases/NearbyPlacesUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCase.dart';

part 'Geolocator_event.dart';
part 'Geolocator_state.dart';

class GeolocatorBloc extends Bloc<GeolocatorEvent, GeolocatorState> {
  final GeolocatorUseCase geolocatorUseCase;
  final SearchPlacesUseCase searchPlacesUseCase;
  final NearbyPlacesUseCase nearbyPlacesUseCase;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  GeolocatorBloc(
    this.geolocatorUseCase,
    this.searchPlacesUseCase,
    this.nearbyPlacesUseCase,
  ) : super(LocationInitial()) {
    Position? position;
    List<Result> tempNearbyPlace = [];

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      add(CheckConnectivityEvent());
    });

    on<CheckGpsStatusEvent>((event, emit) async {
      final isEnabled = await Geolocator.isLocationServiceEnabled();
      emit(state.copyWith(hasGpsEnabled: isEnabled));

      if (!isEnabled) {
        emit(state.copyWith(
          errorMessage: 'GPS is disabled. Please enable location services.',
        ));
      }
    });

    on<UpdateFiltersEvent>((event, emit) async {
      emit(state.copyWith(
        isExpanded: false,
        selectedFilters: event.selectedFilters,
      ));

      if (event.selectedFilters.isEmpty) {
        emit(state.copyWith(
          markers: _createMarkersFromPlaces(state.nearbyPlaces ?? []),
        ));
        return;
      }

      final filteredPlaces = state.nearbyPlaces?.where((place) {
            return place.categories?.any((category) =>
                    event.selectedFilters.contains(category.shortName)) ??
                false;
          }).toList() ??
          [];

      emit(state.copyWith(
        markers: _createMarkersFromPlaces(filteredPlaces),
      ));
    });

    on<CheckConnectivityEvent>((event, emit) async {
      final result = await _connectivity.checkConnectivity();
      final hasConnection = result != ConnectivityResult.none;
      emit(state.copyWith(hasInternetConnection: hasConnection));
    });

    on<LocationInitEvent>((event, emit) async {
      Completer<GoogleMapController> controller =
          Completer<GoogleMapController>();
      emit(
        state.copyWith(
          controller: controller,
        ),
      );
      add(FindPosition());
    });

    on<FindPosition>(
      ((event, emit) async {
        try {
          final isGpsEnabled = await Geolocator.isLocationServiceEnabled();
          if (!isGpsEnabled) {
            emit(state.copyWith(
              hasGpsEnabled: false,
              errorMessage: 'Please enable GPS to use this feature',
            ));
            return;
          }

          final connectivityResult = await _connectivity.checkConnectivity();

          if (connectivityResult == ConnectivityResult.none) {
            emit(state.copyWith(
              hasInternetConnection: false,
              errorMessage: 'No internet connection',
            ));
            return;
          }

          Set<Marker> markersSet = {};
          Set<String> categories = {};

          position = await geolocatorUseCase.findPosition.run();

          List<Result> nearbyPlaces = await searchPlacesUseCase.run(
              '', position?.latitude ?? 0.0, position?.longitude ?? 0.0);

          for (var place in nearbyPlaces) {
            place.categories?.forEach((category) {
              if (category.shortName != null) {
                categories.add(category.shortName!);
              }
            });
          }

          Marker marker = geolocatorUseCase.getMarker.run(
            'MyLocation',
            position?.latitude ?? 0.0,
            position?.longitude ?? 0.0,
            'My position',
            '',
            () async {
              add(SelectMarkerEvent(const MarkerId('MyLocation')));
            },
          );

          markersSet.add(marker);

          emit(state.copyWith(
            position: position,
            nearbyPlaces: nearbyPlaces,
            availableCategories: categories,
            markers: _createMarkersFromPlaces(nearbyPlaces),
          ));
        } catch (e) {
          emit(state.copyWith(errorMessage: e.toString()));
        }
      }),
    );

    on<UpdateAvailableCategoriesEvent>((event, emit) {
      emit(state.copyWith(availableCategories: event.categories));
    });

    on<SelectMarkerEvent>((event, emit) {
      emit(state.copyWith(
        selectedMarker: event.marker,
      ));
    });

    on<OnExpanded>((event, emit) {
      emit(state.copyWith(
        isExpanded: !state.isExpanded,
      ));
    });

    on<ChangeMapCameraPosition>(
      (event, emit) async {
        try {
          GoogleMapController googleMapController =
              await state.controller!.future;
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(event.lat, event.lng),
                zoom: 16,
                bearing: 0,
              ),
            ),
          );
        } catch (e) {
          emit(state.copyWith(errorMessage: 'Error Move Camera: $e'));
        }
      },
    );

    on<OnCameraMove>((event, emit) {
      emit(state.copyWith(cameraPosition: event.cameraPosition));
    });

    on<OnSearchPlacesEvent>(
      (event, emit) async {
        try {
          List<Result> searchResults = await searchPlacesUseCase.run(
            event.query,
            position?.latitude ?? 0.0,
            position?.longitude ?? 0.0,
          );

          tempNearbyPlace = searchResults.where((result) {
            return result.categories?.any((category) =>
                    category.pluralName
                        ?.toLowerCase()
                        .contains(event.query.toLowerCase()) ??
                    false) ??
                false;
          }).toList();

          emit(state.copyWith(
            nearbyPlaces: searchResults,
            tempNearbyPlaces: tempNearbyPlace,
            query: event.query,
          ));
        } catch (e) {
          emit(state.copyWith(errorMessage: 'Failed to load places: $e'));
        }
      },
    );
  }
  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }

  Map<MarkerId, Marker> _createMarkersFromPlaces(List<Result> places) {
    Map<MarkerId, Marker> newMarkers = {};

    if (state.position != null) {
      Marker myLocationMarker = geolocatorUseCase.getMarker.run(
        'MyLocation',
        state.position?.latitude ?? 0.0,
        state.position?.longitude ?? 0.0,
        'My position',
        '',
        () {
          add(SelectMarkerEvent(const MarkerId('MyLocation')));
        },
      );
      newMarkers[myLocationMarker.markerId] = myLocationMarker;
    }

    for (var place in places) {
      Marker marker = geolocatorUseCase.getMarker.run(
        place.fsqId.toString(),
        place.geocodes?.main?.latitude?.toDouble() ?? 0.0,
        place.geocodes?.main?.longitude?.toDouble() ?? 0.0,
        place.name.toString(),
        '',
        () {
          add(SelectMarkerEvent(MarkerId(place.fsqId.toString())));
        },
      );
      newMarkers[marker.markerId] = marker;
    }

    return newMarkers;
  }
}
