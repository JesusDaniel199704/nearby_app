part of 'Location_bloc.dart';

class LocationState extends Equatable {
  final bool isButtonVisible;
  final bool isModalVisible;
  final Completer<GoogleMapController>? controller;
  final CameraPosition cameraPosition;
  final LocationAdress? placemarkData;
  final LatLng? destinationLatLng;
  final String? destinationDescription;
  final LatLng? pickUpLatLng;
  final String? pickUpDescription;
  final MarkerId? selectedMarker;
  final Position? position;
  final List<Place>? nearbyPlaces;
  final Map<MarkerId, Marker> markers;

  const LocationState({
    this.controller,
    this.cameraPosition = const CameraPosition(
      target: LatLng(37.32463648, -122.02314348),
      zoom: 13,
    ),
    this.destinationDescription = '',
    this.destinationLatLng,
    this.isButtonVisible = false,
    this.isModalVisible = false,
    this.markers = const <MarkerId, Marker>{},
    this.nearbyPlaces,
    this.pickUpDescription = '',
    this.pickUpLatLng,
    this.placemarkData,
    this.position,
    this.selectedMarker,
  });

  LocationState copyWith({
    Position? position,
    CameraPosition? cameraPosition,
    LocationAdress? placemarkData,
    List<Place>? nearbyPlaces,
    Completer<GoogleMapController>? controller,
    MarkerId? selectedMarker,
    bool? isModalVisible,
    bool? isButtonVisible,
    Map<MarkerId, Marker>? markers,
    LatLng? pickUpLatLng,
    LatLng? destinationLatLng,
    String? pickUpDescription,
    String? destinationDescription,
  }) {
    return LocationState(
      cameraPosition: cameraPosition ?? this.cameraPosition,
      controller: controller ?? this.controller,
      destinationDescription:
          destinationDescription ?? this.destinationDescription,
      destinationLatLng: destinationLatLng ?? this.destinationLatLng,
      isButtonVisible: isButtonVisible ?? this.isButtonVisible,
      isModalVisible: isModalVisible ?? this.isModalVisible,
      markers: markers ?? this.markers,
      nearbyPlaces: nearbyPlaces ?? this.nearbyPlaces,
      pickUpDescription: pickUpDescription ?? this.pickUpDescription,
      pickUpLatLng: pickUpLatLng ?? this.pickUpLatLng,
      placemarkData: placemarkData ?? this.placemarkData,
      position: position ?? this.position,
      selectedMarker: selectedMarker ?? this.selectedMarker,
    );
  }

  @override
  List<Object> get props => [
        cameraPosition,
        controller ?? [],
        destinationDescription ?? '',
        destinationLatLng ?? 0,
        isButtonVisible,
        isModalVisible,
        markers,
        nearbyPlaces ?? [],
        pickUpDescription ?? '',
        pickUpLatLng ?? 0,
        placemarkData ?? '',
        position ?? 0,
        selectedMarker ?? '',
      ];
}

class LocationInitial extends LocationState {}
