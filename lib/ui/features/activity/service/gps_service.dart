import 'package:geolocator/geolocator.dart';
import 'package:pace_up/ui/features/activity/model/activity_models.dart';

abstract class GpsService {
  Future<DevicePosition> getDevicePostion();
  double getDistance(DevicePosition a, DevicePosition b);
}

class GeoLocatorGpsService implements GpsService {
  @override
  Future<DevicePosition> getDevicePostion() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    var position = await Geolocator.getCurrentPosition();

    return DevicePosition(
      longitude: position.longitude,
      latitude: position.latitude,
    );
  }

  @override
  double getDistance(DevicePosition a, DevicePosition b) {
    return Geolocator.distanceBetween(
      a.latitude,
      a.longitude,
      b.latitude,
      b.longitude,
    );
  }
}
