import 'package:flutter/material.dart';
import 'package:pace_up/ui/features/activity/viewmodel/activity_viewmodel.dart';

class ElapsedTime extends StatelessWidget {
  final TimeState _timeState;
  const ElapsedTime({required TimeState timeState, super.key})
    : _timeState = timeState;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _timeState,
      builder: (builder, _) {
        return Text(
          "Elapsed: ${_timeState.secondsElapsed ~/ 60} mins ${_timeState.secondsElapsed % 60} secs",
        );
      },
    );
  }
}
