import 'package:nearby_app/features/geolocator/domain/useCases/GetMarkerUseCase.dart';
import 'package:nearby_app/features/geolocator/domain/useCases/getLocationUsecase.dart';

class GeolocatorUseCase {
  FindPositionUseCase findPosition;
  GetMarkerUseCase getMarker;
  GeolocatorUseCase({
    required this.findPosition,
    required this.getMarker,
  });
}
