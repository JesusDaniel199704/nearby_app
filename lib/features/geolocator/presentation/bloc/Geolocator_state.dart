part of 'Geolocator_bloc.dart';

class GeolocatorState extends Equatable {
  final bool isExpanded;
  final bool isSelected;
  final Set<String> availableCategories;
  final Completer<GoogleMapController>? controller;
  final CameraPosition cameraPosition;
  final String query;
  final String errorMessage;
  final MarkerId? selectedMarker;
  final Position? position;
  final List<Result>? nearbyPlaces;
  final List<Result>? tempNearbyPlaces;
  final Map<MarkerId, Marker> markers;
  final bool isLoadingCategories;
  final List<String>? filterList;
  final bool hasInternetConnection;
  final bool hasGpsEnabled;
  final List<String> selectedFilters;
  const GeolocatorState({
    this.controller,
    this.errorMessage = '',
    this.availableCategories = const {},
    this.hasInternetConnection = true,
    this.isLoadingCategories = false,
    this.hasGpsEnabled = true,
    this.selectedFilters = const [],
    this.cameraPosition = const CameraPosition(
      target: LatLng(37.32463648, -122.02314348),
      zoom: 13,
    ),
    this.filterList,
    this.query = '',
    this.isExpanded = false,
    this.isSelected = false,
    this.markers = const <MarkerId, Marker>{},
    this.nearbyPlaces,
    this.tempNearbyPlaces,
    this.position,
    this.selectedMarker,
  });

  GeolocatorState copyWith({
    bool? hasInternetConnection,
    bool? hasGpsEnabled,
    bool? isLoadingCategories,
    List<String>? selectedFilters,
    Position? position,
    CameraPosition? cameraPosition,
    List<Result>? nearbyPlaces,
    List<Result>? tempNearbyPlaces,
    List<String>? filterList,
    Set<String>? availableCategories,
    String? errorMessage,
    String? query,
    Completer<GoogleMapController>? controller,
    MarkerId? selectedMarker,
    bool? isExpanded,
    bool? isSelected,
    Map<MarkerId, Marker>? markers,
  }) {
    return GeolocatorState(
      cameraPosition: cameraPosition ?? this.cameraPosition,
      controller: controller ?? this.controller,
      query: query ?? this.query,
      availableCategories: availableCategories ?? this.availableCategories,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      hasInternetConnection:
          hasInternetConnection ?? this.hasInternetConnection,
      hasGpsEnabled: hasGpsEnabled ?? this.hasGpsEnabled,
      selectedFilters: selectedFilters ?? this.selectedFilters,
      errorMessage: errorMessage ?? this.errorMessage,
      filterList: filterList ?? this.filterList,
      tempNearbyPlaces: tempNearbyPlaces ?? this.tempNearbyPlaces,
      isExpanded: isExpanded ?? this.isExpanded,
      isSelected: isSelected ?? this.isSelected,
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
        isSelected,
        isLoadingCategories,
        filterList ?? [],
        errorMessage,
        isExpanded,
        tempNearbyPlaces ?? [],
        markers,
        query,
        nearbyPlaces ?? [],
        position ?? 0,
        selectedMarker ?? '',
      ];
}

class LocationInitial extends GeolocatorState {}
