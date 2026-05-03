import 'package:flutter/material.dart';
import 'package:pace_up/ui/features/activity/viewmodel/activity_viewmodel.dart';
import 'package:pace_up/ui/theme/colors.dart';

class ActivityButton extends StatelessWidget {
  final GpsState _gpsState;
  final VoidCallback _onStart;
  final VoidCallback _onStop;
  const ActivityButton({
    required GpsState gpsState,
    required VoidCallback onStart,
    required VoidCallback onStop,
    super.key,
  }) : _gpsState = gpsState,
       _onStart = onStart,
       _onStop = onStop;

  @override
  Widget build(BuildContext context) {
    final colors = PaceUpColors.of(context);

    return ListenableBuilder(
      listenable: _gpsState,
      builder: (builder, _) {
        return IconButton.outlined(
          onPressed: () {
            if (!_gpsState.isRecording) {
              _onStart();
            } else {
              _onStop();
            }
          },
          iconSize: 48,
          icon: Padding(
            padding: const EdgeInsetsGeometry.all(0),
            child: Icon(
              _gpsState.isRecording ? Icons.stop : Icons.play_arrow,
              color: _gpsState.isRecording ? colors.stopRed : Colors.black,
            ),
          ),
          style: IconButton.styleFrom(backgroundColor: colors.surfaceElevated),
        );
      },
    );
  }
}
