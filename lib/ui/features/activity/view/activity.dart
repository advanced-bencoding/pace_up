import 'package:flutter/material.dart';
import 'package:pace_up/ui/features/activity/model/activity_models.dart';
import 'package:pace_up/ui/features/activity/service/gps_service.dart';
import 'package:pace_up/ui/features/activity/viewmodel/activity_viewmodel.dart';
import 'package:pace_up/ui/theme/colors.dart';
import 'package:pace_up/ui/theme/dimensions.dart';
import 'package:pace_up/ui/theme/typography.dart';

class Activity extends StatelessWidget {
  Activity({super.key});

  final ActivityViewModel viewModel = ActivityViewModel(
    gpsService: GeoLocatorGpsService(),
  );

  @override
  Widget build(BuildContext context) {
    final colors = PaceUpColors.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: PaceUpSpacing.screenPadding,
                vertical: PaceUpSpacing.gapSm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CURRENT PACE",
                    style: PaceUpTextStyles.label.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PaceDisplay(viewModel.currentPace),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
                        child: Text(
                          "/km",
                          style: PaceUpTextStyles.metricValue.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Elapsed: ${viewModel.secondsElapsed ~/ 60} mins ${viewModel.secondsElapsed % 60} secs",
                  ),
                  Expanded(child: ListView(children: [])),
                  Center(
                    child: IconButton.outlined(
                      onPressed: () {
                        if (viewModel.isRecording) {
                          viewModel.stopTracking();
                        } else {
                          viewModel.startTracking();
                        }
                      },
                      iconSize: 48,
                      icon: Padding(
                        padding: const EdgeInsetsGeometry.all(0),
                        child: Icon(
                          viewModel.isRecording ? Icons.stop : Icons.play_arrow,
                          color: viewModel.isRecording
                              ? colors.stopRed
                              : Colors.black,
                        ),
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: colors.surfaceElevated,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PaceDisplay extends StatelessWidget {
  final Pace pace;
  const PaceDisplay(this.pace, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = PaceUpColors.of(context);

    return Text(
      pace.toString(),
      style: PaceUpTextStyles.paceHero.copyWith(color: colors.textPrimary),
    );
  }
}
