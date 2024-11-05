import 'package:nearby_app/features/geolocator/domain/useCases/GetMarkerUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/getLocationUsecase.dart';

class GeolocatorUseCases {
  FindPositionUseCase findPosition;
  GetMarkerUseCase getMarker;
  GeolocatorUseCases({
    required this.findPosition,
    required this.getMarker,
  });
}
