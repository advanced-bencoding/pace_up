import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pace_up/data/location.dart';

class Activity extends StatefulWidget {
  
  const Activity({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ActivityState();
  }
}

class _ActivityState extends State<StatefulWidget> {
  Timer? _locationTrackingTimer;
  final _positions = Queue<Position>();
  double _totalDistance = 0.0;
  Pace _pace = Pace(0, 0);
  
  void startTracking() {
    print("started tracking");
    _locationTrackingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      determinePosition().then((position) {
        var distanceToBeAdded = Geolocator.distanceBetween(_positions.last.latitude, _positions.last.longitude, position.latitude, position.longitude);
        _positions.add(position);
        
        print("added pos");
        if (_positions.length < 10) {
          return;
        }
        if (_positions.length == 10) {
          var positions = _positions.toList();
          for (int i = 1; i < positions.length; i++) {
            _totalDistance += Geolocator.distanceBetween(positions[i].latitude, positions[i].longitude, positions[i - 1].latitude, positions[i - 1].longitude);
          } 
        }
        else if (_positions.length > 10) {
          var positionRemoved = _positions.removeFirst();
          var distance = Geolocator.distanceBetween(_positions.first.latitude, _positions.first.longitude, positionRemoved.latitude, positionRemoved.longitude);
          _totalDistance -= distance;
          _totalDistance += distanceToBeAdded;
        }

        // calculate pace here
        setState(() {
          _pace = calculatePace(_totalDistance);
        });
      }).catchError((error) {
        print(error);
      });
    });
  }

  void onStartStop() {
    if (_locationTrackingTimer == null) {
      startTracking();
    }
    else {
      _locationTrackingTimer?.cancel();
      _locationTrackingTimer = null;
      print("stopped tracking");
    }
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          PaceDisplay(_pace),
          IconButton(onPressed: onStartStop, icon: Icon(Icons.start))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _locationTrackingTimer?.cancel();
    super.dispose();
  }
}

class PaceDisplay extends StatelessWidget {
  final Pace pace;
  const PaceDisplay(this.pace, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(pace.toString());
  }
}

class Pace {
  final int minutes;
  final int seconds;

  Pace(this.minutes, this.seconds);

  @override
  String toString() => '$minutes:${seconds.toString().padLeft(2, '0')}';
}