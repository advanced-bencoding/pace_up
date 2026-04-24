import 'package:flutter/material.dart';
import 'package:pace_up/theme/colors.dart';

Color paceColor(int deltaSeconds, {bool dark = true}) {
  if (deltaSeconds < -15) return dark ? PaceUpDark.paceFast    : PaceUpLight.paceFast;
  if (deltaSeconds >  20) return dark ? PaceUpDark.paceSlow    : PaceUpLight.paceSlow;
  if (deltaSeconds >   8) return dark ? PaceUpDark.paceWarning : PaceUpLight.paceWarning;
  return dark ? PaceUpDark.paceNeutral : PaceUpLight.paceNeutral;
}
 
Color paceBgColor(int deltaSeconds, {bool dark = true}) {
  if (deltaSeconds < -15) return dark ? PaceUpDark.paceFastBg    : PaceUpLight.paceFastBg;
  if (deltaSeconds >  20) return dark ? PaceUpDark.paceSlowBg    : PaceUpLight.paceSlowBg;
  if (deltaSeconds >   8) return dark ? PaceUpDark.paceWarningBg : PaceUpLight.paceWarningBg;
  return dark ? PaceUpDark.paceNeutralBg : PaceUpLight.paceNeutralBg;
}
 
// Convenience: resolve from BuildContext so you don't pass [dark] manually.
Color paceColorOf(BuildContext context, int deltaSeconds) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return paceColor(deltaSeconds, dark: isDark);
}
 
Color paceBgColorOf(BuildContext context, int deltaSeconds) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return paceBgColor(deltaSeconds, dark: isDark);
}
