part of 'Geolocator_bloc.dart';

class GeolocatorState extends Equatable {
  final bool isModalVisible;
  final Completer<GoogleMapController>? controller;
  final CameraPosition cameraPosition;
  final String query;
  final MarkerId? selectedMarker;
  final Position? position;
  final List<Result>? nearbyPlaces;
  final Map<MarkerId, Marker> markers;

  const GeolocatorState({
    this.controller,
    this.cameraPosition = const CameraPosition(
      target: LatLng(37.32463648, -122.02314348),
      zoom: 13,
    ),
    this.query = '',
    this.isModalVisible = false,
    this.markers = const <MarkerId, Marker>{},
    this.nearbyPlaces,
    this.position,
    this.selectedMarker,
  });

  GeolocatorState copyWith({
    Position? position,
    CameraPosition? cameraPosition,
    List<Result>? nearbyPlaces,
    String? query,
    Completer<GoogleMapController>? controller,
    MarkerId? selectedMarker,
    bool? isModalVisible,
    Map<MarkerId, Marker>? markers,
  }) {
    return GeolocatorState(
      cameraPosition: cameraPosition ?? this.cameraPosition,
      controller: controller ?? this.controller,
      query: query ?? this.query,
      isModalVisible: isModalVisible ?? this.isModalVisible,
      markers: markers ?? this.markers,
      nearbyPlaces: nearbyPlaces ?? this.nearbyPlaces,
      position: position ?? this.position,
      selectedMarker: selectedMarker ?? this.selectedMarker,
    );
  }

  @override
  List<Object> get props => [
        cameraPosition,
        controller ?? [],
        isModalVisible,
        markers,
        query,
        nearbyPlaces ?? [],
        position ?? 0,
        selectedMarker ?? '',
      ];
}

class LocationInitial extends GeolocatorState {}
