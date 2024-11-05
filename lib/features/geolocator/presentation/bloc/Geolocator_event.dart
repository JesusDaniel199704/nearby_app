part of 'Geolocator_bloc.dart';

abstract class GeolocatorEvent {}

class LocationInitEvent extends GeolocatorEvent {}

class FindPosition extends GeolocatorEvent {}

class ChangeMapCameraPosition extends GeolocatorEvent {
  final double lat;
  final double lng;

  ChangeMapCameraPosition({required this.lat, required this.lng});
}

class OnCameraMove extends GeolocatorEvent {
  CameraPosition cameraPosition;

  OnCameraMove({required this.cameraPosition});
}

class OnSearchPlacesEvent extends GeolocatorEvent {
  String query;
  OnSearchPlacesEvent({
    required this.query,
  });
}

class SelectMarkerEvent extends GeolocatorEvent {
  final MarkerId marker;

  SelectMarkerEvent(this.marker);
}
