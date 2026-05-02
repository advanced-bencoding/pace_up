import 'package:flutter/material.dart';
import 'package:pace_up/ui/theme/colors.dart';

Color paceColor(int deltaSeconds, PaceUpColors colors) {
  if (deltaSeconds < -15) return colors.paceFast;
  if (deltaSeconds > 20) colors.paceSlow;
  if (deltaSeconds > 8) colors.paceWarning;
  return colors.paceNeutral;
}

Color paceBgColor(int deltaSeconds, PaceUpColors colors) {
  if (deltaSeconds < -15) return colors.paceFastBg;
  if (deltaSeconds > 20) colors.paceSlowBg;
  if (deltaSeconds > 8) colors.paceWarningBg;
  return colors.paceNeutralBg;
}

// Convenience: resolve from BuildContext so you don't pass [dark] manually.
Color paceColorOf(BuildContext context, int deltaSeconds) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final paceUpColors = isDark ? PaceUpDark() : PaceUpLight();
  return paceColor(deltaSeconds, paceUpColors);
}

Color paceBgColorOf(BuildContext context, int deltaSeconds) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final paceUpColors = isDark ? PaceUpDark() : PaceUpLight();
  return paceBgColor(deltaSeconds, paceUpColors);
}
