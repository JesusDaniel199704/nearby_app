import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/places/domain/entities/place.dart';
import 'package:nearby_app/features/places/domain/usecases/SearchPlacesUseCase.dart';
import 'package:nearby_app/features/places/domain/usecases/NearbyPlacesUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCases.dart';

part 'Geolocator_event.dart';
part 'Geolocator_state.dart';

class GeolocatorBloc extends Bloc<GeolocatorEvent, GeolocatorState> {
  final GeolocatorUseCases geolocatorUseCase;
  final SearchPlacesUseCase searchPlacesUseCase;
  final NearbyPlacesUseCase nearbyPlacesUseCase;
  GeolocatorBloc(this.geolocatorUseCase, this.searchPlacesUseCase,
      this.nearbyPlacesUseCase)
      : super(LocationInitial()) {
    Position? position;

    on<LocationInitEvent>((event, emit) async {
      Completer<GoogleMapController> controller =
          Completer<GoogleMapController>();
      add(FindPosition());

      emit(
        state.copyWith(
          controller: controller,
        ),
      );
    });

    on<FindPosition>(((event, emit) async {
      Set<Marker> markersSet = {};

      position = await geolocatorUseCase.findPosition.run();

      List<Result> nearbyPlaces = await nearbyPlacesUseCase.run(
          position?.latitude ?? 0.0, position?.longitude ?? 0.0);

      Marker marker = geolocatorUseCase.getMarker.run(
        'MyLocation',
        position?.latitude ?? 0.0,
        position?.longitude ?? 0.0,
        'My position',
        '',
        () async {
          add(SelectMarkerEvent(MarkerId('MyLocation')));
        },
      );
      markersSet.add(marker);
      nearbyPlaces.forEach(
        (place) {
          Marker marker = geolocatorUseCase.getMarker.run(
            place.fsqId.toString(),
            place.geocodes?.main?.latitude?.toDouble() ?? 0.0,
            place.geocodes?.main?.longitude?.toDouble() ?? 0.0,
            place.name.toString(),
            '',
            () async {
              add(SelectMarkerEvent(MarkerId(place.fsqId.toString())));
            },
          );
          markersSet.add(marker);
        },
      );
      Map<MarkerId, Marker> markersMap = {
        for (var marker in markersSet) marker.markerId: marker,
      };
      emit(state.copyWith(
        position: position,
        markers: markersMap,
      ));
      add(
        ChangeMapCameraPosition(
          lat: position?.latitude ?? 0.0,
          lng: position?.longitude ?? 0.0,
        ),
      );
    }));

    on<SelectMarkerEvent>((event, emit) {
      emit(state.copyWith(
        selectedMarker: event.marker,
        isModalVisible: true,
      ));
    });

    on<ChangeMapCameraPosition>(
      (event, emit) async {
        try {
          GoogleMapController googleMapController =
              await state.controller!.future;
          await googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(event.lat, event.lng),
                zoom: 13,
                bearing: 0,
              ),
            ),
          );
        } catch (e) {
          print("object $e");
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

          List<Result> filteredResults = searchResults.where((result) {
            return result.categories?.any((category) =>
                    category.pluralName
                        ?.toLowerCase()
                        .contains(event.query.toLowerCase()) ??
                    false) ??
                false;
          }).toList();

          emit(state.copyWith(
            nearbyPlaces: filteredResults,
            query: event.query,
          ));
        } catch (e) {
          throw Exception('Failed to load places $e');
        }
      },
    );
  }
}
