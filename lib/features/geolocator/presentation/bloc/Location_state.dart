part of 'Location_bloc.dart';

class LocationState extends Equatable {
  final Completer<GoogleMapController>? controller;
  final Position? position;
  final Map<MarkerId, Marker> markers;
  final CameraPosition cameraPosition;
  final LocationAdress? placemarkData;
  final LatLng? pickUpLatLng;
  final LatLng? destinationLatLng;
  final String? pickUpDescription;
  final String? destinationDescription;
  final List<Place>? nearbyPlaces;
  const LocationState({
    this.position,
    this.placemarkData,
    this.nearbyPlaces,
    this.cameraPosition = const CameraPosition(
      target: LatLng(37.32463648, -122.02314348),
      zoom: 13,
    ),
    this.controller,
    this.markers = const <MarkerId, Marker>{},
    this.destinationLatLng,
    this.pickUpLatLng,
    this.destinationDescription = '',
    this.pickUpDescription = '',
  });

  LocationState copyWith(
      {Position? position,
      CameraPosition? cameraPosition,
      LocationAdress? placemarkData,
      List<Place>? nearbyPlaces,
      Completer<GoogleMapController>? controller,
      Map<MarkerId, Marker>? markers,
      LatLng? pickUpLatLng,
      LatLng? destinationLatLng,
      String? pickUpDescription,
      String? destinationDescription}) {
    return LocationState(
      position: position ?? this.position,
      controller: controller ?? this.controller,
      nearbyPlaces: nearbyPlaces ?? this.nearbyPlaces,
      markers: markers ?? this.markers,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      placemarkData: placemarkData ?? this.placemarkData,
      pickUpLatLng: pickUpLatLng ?? this.pickUpLatLng,
      destinationLatLng: destinationLatLng ?? this.destinationLatLng,
      destinationDescription:
          destinationDescription ?? this.destinationDescription,
      pickUpDescription: pickUpDescription ?? this.pickUpDescription,
    );
  }

  @override
  List<Object> get props => [
        position ?? 0,
        controller ?? [],
        markers,
        nearbyPlaces ?? [],
        cameraPosition,
        placemarkData ?? '',
        pickUpLatLng ?? 0,
        destinationLatLng ?? 0,
        destinationDescription ?? '',
        pickUpDescription ?? '',
      ];
}

class LocationInitial extends LocationState {}
