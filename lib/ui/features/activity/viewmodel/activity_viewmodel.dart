import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pace_up/ui/features/activity/model/activity_models.dart';
import 'package:pace_up/ui/features/activity/service/gps_service.dart';

class ActivityViewModel extends ChangeNotifier {
  final GpsService _gpsService;
  final List<DevicePosition> _coordinates = [];
  late Timer _locationTrackingTimer;

  String? error;
  Pace currentPace = Pace(0, 0);
  int secondsElapsed = 0;
  bool isRecording = false;

  ActivityViewModel({required GpsService gpsService})
    : _gpsService = gpsService;

  void startTracking() {
    devicePositionHandler();
    isRecording = true;
    notifyListeners();
  }

  void devicePositionHandler() {
    _locationTrackingTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      _gpsService
          .getDevicePostion()
          .then((currentPosition) {
            _coordinates.add(currentPosition);
            if (_coordinates.length > 10) {
              _coordinates.removeAt(0);
            }

            if (_coordinates.length == 10) {
              double totalDistanceCovered = 0.0;
              for (int i = 1; i < _coordinates.length; i += 1) {
                totalDistanceCovered += _gpsService.getDistance(
                  _coordinates[i - 1],
                  _coordinates[i],
                );
              }

              currentPace = calculatePace(totalDistanceCovered);
              notifyListeners();
            }
          })
          .catchError((e) {
            error = e;
            notifyListeners();
          });
    });
  }

  void stopTracking() {
    _locationTrackingTimer.cancel();
    isRecording = false;
    notifyListeners();
  }

  Pace calculatePace(double totalDistanceMeters) {
    if (totalDistanceMeters <= 0) {
      return Pace(0, 0); // or handle as invalid
    }

    // pace in seconds per km
    double paceSeconds = 10000 / totalDistanceMeters;

    int minutes = paceSeconds ~/ 60;
    int seconds = (paceSeconds % 60).round();

    // handle edge case where seconds rounds to 60
    if (seconds == 60) {
      minutes += 1;
      seconds = 0;
    }

    return Pace(minutes, seconds);
  }
}
