import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/places/domain/entities/place.dart';
import 'package:nearby_app/features/places/domain/usecases/NearbyPlacesUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCase.dart';

part 'Geolocator_event.dart';
part 'Geolocator_state.dart';

class GeolocatorBloc extends Bloc<GeolocatorEvent, GeolocatorState> {
  final GeolocatorUseCase geolocatorUseCase;
  final NearbyPlacesUseCase nearbyPlacesUseCase;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;
  Position? position;

  GeolocatorBloc(
    this.geolocatorUseCase,
    this.nearbyPlacesUseCase,
  ) : super(LocationInitial()) {
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

          Set<String> categories = {};
          List<Category> listCategory = [];
          position = await geolocatorUseCase.findPosition.run();
          if (position != null) {
            final controller = await state.controller?.future;
            if (controller != null) {
              await controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(position!.latitude, position!.longitude),
                    zoom: 15,
                  ),
                ),
              );
            }
            List<Result> nearbyPlaces = await nearbyPlacesUseCase.run(
                position?.latitude ?? 0.0, position?.longitude ?? 0.0);

            final markers = _createMarkersForCurrentPosition(position!);

            emit(state.copyWith(
              position: position,
              markers: markers,
              cameraPosition: CameraPosition(
                target: LatLng(position!.latitude, position!.longitude),
                zoom: 15,
              ),
            ));

            for (var place in nearbyPlaces) {
              place.categories?.forEach((category) {
                listCategory.add(category);
                if (category.shortName != null) {
                  categories.add(category.shortName!);
                }
              });
            }

            emit(state.copyWith(
              position: position,
              nearbyPlaces: nearbyPlaces,
              availableCategories: categories,
              markers: _createMarkersFromPlaces(nearbyPlaces),
            ));
          }
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

    on<OnSearchPlacesEvent>(
      (event, emit) async {
        try {
          List<Result> searchResults = await nearbyPlacesUseCase.run(
            position?.latitude ?? 0.0,
            position?.longitude ?? 0.0,
          );

          List<Result> searchTemp = searchResults.where((result) {
            return result.name!
                .toLowerCase()
                .contains(event.query.toLowerCase());
          }).toList();
          emit(state.copyWith(
            nearbyPlaces: searchTemp,
            query: event.query,
          ));
        } catch (e) {
          emit(state.copyWith(errorMessage: 'Failed to load places: $e'));
        }
      },
    );
  }

  Map<MarkerId, Marker> _createMarkersForCurrentPosition(Position position) {
    return {
      const MarkerId('MyLocation'): Marker(
        markerId: const MarkerId('MyLocation'),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: const InfoWindow(title: 'My Location'),
        onTap: () {
          add(SelectMarkerEvent(const MarkerId('MyLocation')));
        },
      ),
    };
  }

  Map<MarkerId, Marker> _createMarkersFromPlaces(List<Result> places) {
    final markers = _createMarkersForCurrentPosition(position!);

    for (var place in places) {
      final markerId = MarkerId(place.fsqId.toString());
      markers[markerId] = Marker(
        markerId: markerId,
        position: LatLng(
          place.geocodes?.main?.latitude?.toDouble() ?? 0.0,
          place.geocodes?.main?.longitude?.toDouble() ?? 0.0,
        ),
        infoWindow: InfoWindow(
            title: place.name.toString(),
            snippet: place.location?.address ?? ''),
        onTap: () {
          add(SelectMarkerEvent(markerId));
        },
      );
    }

    return markers;
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
