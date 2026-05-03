import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pace_up/ui/features/activity/model/activity_models.dart';
import 'package:pace_up/ui/features/activity/service/gps_service.dart';

class ActivityViewModel {
  final GpsState gpsState;
  final TimeState timeState = TimeState();

  ActivityViewModel({required GpsService gpsService})
    : gpsState = GpsState(gpsService: gpsService);

  void startRecordingActivity() {
    gpsState.startTracking();
    timeState.startTimer();
  }

  void stopRecordingActivity() {
    gpsState.stopTracking();
    timeState.stopTimer();
  }
}

class TimeState extends ChangeNotifier {
  int secondsElapsed = 0;
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _stopWatchTimer;

  void startTimer() {
    _stopwatch.start();
    _stopWatchTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      secondsElapsed = _stopwatch.elapsed.inSeconds;
      notifyListeners();
    });
  }

  void stopTimer() {
    _stopwatch.stop();
    _stopWatchTimer?.cancel();
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _stopWatchTimer?.cancel();
    super.dispose();
  }
}

class GpsState extends ChangeNotifier {
  final GpsService _gpsService;
  final List<DevicePosition> _coordinates = [];
  Timer? _locationTrackingTimer;

  Pace currentPace = Pace(0, 0);
  String? error;
  bool isRecording = false;

  GpsState({required GpsService gpsService}) : _gpsService = gpsService;

  void startTracking() {
    _devicePositionHandler();
    isRecording = true;
    notifyListeners();
  }

  void _devicePositionHandler() {
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
    _locationTrackingTimer?.cancel();
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

  @override
  void dispose() {
    _locationTrackingTimer?.cancel();
    super.dispose();
  }
}
