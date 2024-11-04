import 'package:nearby_app/features/geolocator/domain/useCases/CreateMarkerUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GetMarkerUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/GetPlacemarkDataUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/getLocationUsecase.dart';

class GeolocatorUseCases {
  FindPositionUseCase findPosition;
  CreateMarkerUseCase createMarker;
  GetMarkerUseCase getMarker;
  GetPlacemarkDataUseCase getPlacemarkData;
  GeolocatorUseCases({
    required this.findPosition,
    required this.createMarker,
    required this.getMarker,
    required this.getPlacemarkData,
  });
}
