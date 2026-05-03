import 'package:flutter/material.dart';
import 'package:pace_up/ui/features/activity/viewmodel/activity_viewmodel.dart';
import 'package:pace_up/ui/theme/colors.dart';
import 'package:pace_up/ui/theme/typography.dart';

class PaceDisplay extends StatelessWidget {
  final GpsState _gpsState;
  const PaceDisplay({super.key, required GpsState gpsState})
    : _gpsState = gpsState;

  @override
  Widget build(BuildContext context) {
    final colors = PaceUpColors.of(context);

    return ListenableBuilder(
      listenable: _gpsState,
      builder: (builder, _) {
        return Text(
          _gpsState.currentPace.toString(),
          style: PaceUpTextStyles.paceHero.copyWith(color: colors.textPrimary),
        );
      },
    );
  }
}
