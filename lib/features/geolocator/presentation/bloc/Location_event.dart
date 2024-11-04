part of 'Location_bloc.dart';

abstract class LocationEvent {}

class LocationInitEvent extends LocationEvent {}

class FindPosition extends LocationEvent {}

class ChangeMapCameraPosition extends LocationEvent {
  final double lat;
  final double lng;

  ChangeMapCameraPosition({required this.lat, required this.lng});
}

class OnCameraMove extends LocationEvent {
  CameraPosition cameraPosition;

  OnCameraMove({required this.cameraPosition});
}

class OnCameraIdle extends LocationEvent {}

class OnSearchPlacesEvent extends LocationEvent {
  String query;
  OnSearchPlacesEvent({
    required this.query,
  });
}

class PlacesEvent extends LocationEvent {
  final String namePlace;
  final double latitude;
  final double longitude;

  PlacesEvent({
    required this.namePlace,
    required this.latitude,
    required this.longitude,
  });
}
