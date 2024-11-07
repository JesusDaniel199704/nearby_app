import 'package:nearby_app/features/geolocator/domain/useCases/getLocationUsecase.dart';

class GeolocatorUseCase {
  FindPositionUseCase findPosition;
  GeolocatorUseCase({
    required this.findPosition,
  });
}
