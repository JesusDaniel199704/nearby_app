import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_app/features/foursquare/domain/entities/place.dart';
import 'package:nearby_app/features/foursquare/domain/usecases/PlacesUseCase.dart';
import 'package:nearby_app/features/foursquare/domain/usecases/SearchPlacesUseCase.dart';
import 'package:nearby_app/features/foursquare/domain/usecases/nearbyPlacesUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/entities/Location.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GeolocatorUseCases.dart';

part 'Location_event.dart';
part 'Location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GeolocatorUseCases geolocatorUseCase;
  final PlacesUseCase placeUseCase;
  final SearchPlacesUseCase searchPlacesUseCase;
  final NearbyPlacesUseCase nearbyPlacesUseCase;
  LocationBloc(this.geolocatorUseCase, this.placeUseCase,
      this.searchPlacesUseCase, this.nearbyPlacesUseCase)
      : super(LocationInitial()) {
    on<LocationInitEvent>((event, emit) {
      Completer<GoogleMapController> controller =
          Completer<GoogleMapController>();

      emit(
        state.copyWith(
          controller: controller,
        ),
      );
    });

    on<OnPlacesEvent>((event, emit) async {
      try {
        List<Place> places = await placeUseCase.run();

        Set<Marker> markersSet = {};
        print("markers ${markersSet.length}");
        places.forEach((place) {
          place.results?.forEach((results) {
            Marker marker = geolocatorUseCase.getMarker.run(
              results.fsqId.toString(),
              results.geocodes?.main?.latitude?.toDouble() ?? 0.0,
              results.geocodes?.main?.longitude?.toDouble() ?? 0.0,
              'My position',
              '',
              () {},
            );
            markersSet.add(marker);
          });
        });

        Map<MarkerId, Marker> markersMap = {
          for (var marker in markersSet) marker.markerId: marker,
        };
        emit(state.copyWith(
          position: state.position,
          markers: markersMap,
        ));
      } catch (e) {
        throw Exception('Failed to load places $e');
      }
    });

    on<FindPosition>(((event, emit) async {
      Position position = await geolocatorUseCase.findPosition.run();
      dynamic nearbyPlaces =
          await nearbyPlacesUseCase.run(position.latitude, position.longitude);
      print("nearbyPlaces: $nearbyPlaces");
      BitmapDescriptor imageMarker = await geolocatorUseCase.createMarker.run(
        'assets/img/location.png',
      );
      Marker marker = geolocatorUseCase.getMarker.run(
        'MyLocation',
        position.latitude,
        position.longitude,
        'My position',
        '',
        () async {
          add(SelectMarkerEvent(MarkerId('MyLocation')));
        },
      );
      add(
        ChangeMapCameraPosition(
          lat: position.latitude,
          lng: position.longitude,
        ),
      );
      emit(state.copyWith(
        position: position,
        markers: {
          marker.markerId: marker,
        },
      ));
      emit(state.copyWith(
        position: position,
      ));
    }));

    on<SelectMarkerEvent>((event, emit) {
      emit(state.copyWith(
        selectedMarker: event.marker,
        isModalVisible: true,
      ));
    });

    on<IsSearching>((event, emit) {
      emit(state.copyWith(
        isButtonVisible: true,
      ));
    });

    on<NotSearching>((event, emit) {
      emit(state.copyWith(
        isButtonVisible: false,
      ));
    });

    on<OnCloseModal>((event, emit) {
      emit(state.copyWith(
        isModalVisible: false,
      ));
    });

    on<ChangeMapCameraPosition>(
      (event, emit) async {
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
      },
    );

    on<OnCameraMove>((event, emit) {
      emit(state.copyWith(cameraPosition: event.cameraPosition));
    });

    on<OnCameraIdle>((event, emit) async {
      LocationAdress placemarkData =
          await geolocatorUseCase.getPlacemarkData.run(state.cameraPosition);
      emit(state.copyWith(placemarkData: placemarkData));
    });

    on<OnSearchPlacesEvent>((event, emit) async {
      try {
        List<Place> searchResults = await searchPlacesUseCase.run(event.query);

        emit(state.copyWith(
          nearbyPlaces: searchResults,
        ));
      } catch (e) {
        throw Exception('Failed to load places $e');
      }
    });
  }
}
