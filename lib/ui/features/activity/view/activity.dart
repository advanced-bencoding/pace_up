import 'package:flutter/material.dart';
import 'package:pace_up/ui/features/activity/service/gps_service.dart';
import 'package:pace_up/ui/features/activity/view/widgets/activity_button.dart';
import 'package:pace_up/ui/features/activity/view/widgets/elapsed_time.dart';
import 'package:pace_up/ui/features/activity/view/widgets/pace.dart';
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
        child: Padding(
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
              PaceDisplay(gpsState: viewModel.gpsState),
              ElapsedTime(timeState: viewModel.timeState),
              Expanded(child: ListView(children: [])),
              Center(
                child: ActivityButton(
                  gpsState: viewModel.gpsState,
                  onStart: () {
                    viewModel.startRecordingActivity();
                  },
                  onStop: () {
                    viewModel.stopRecordingActivity();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
