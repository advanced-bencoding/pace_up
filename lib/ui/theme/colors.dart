import 'package:flutter/material.dart';

abstract class PaceUpColors {
  const PaceUpColors();
  Color get background;
  Color get surface;
  Color get paceFast;
  Color get paceNeutral;
  Color get paceWarning;
  Color get paceSlow;
  Color get paceFastBg;
  Color get paceNeutralBg;
  Color get paceWarningBg;
  Color get paceSlowBg;
  Color get textPrimary;
  Color get textSecondary;
  Color get textTertiary;
  Color get border;
  Color get divider;
  Color get surfaceElevated;
  Color get stopRed;

  // Convenience singleton instances
  static const dark = PaceUpDark();
  static const light = PaceUpLight();

  static PaceUpColors of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }
}

class PaceUpDark extends PaceUpColors {
  const PaceUpDark();
  // Backgrounds
  @override
  Color get background => const Color(0xFF0D0D0D);
  @override
  Color get surface => const Color(0xFF1A1A1A);
  @override
  Color get surfaceElevated => const Color(0xFF232323);

  // Borders
  @override
  Color get border => const Color(0xFF2A2A2A);
  @override
  Color get divider => const Color(0xFF1C1C1C);

  // Text
  @override
  Color get textPrimary => const Color(0xFFF0F0F0);
  @override
  Color get textSecondary => const Color(0xFF888888);
  @override
  Color get textTertiary => const Color(0xFF444444);

  // Pace semantics
  @override
  Color get paceFast => const Color(0xFF22C55E);
  @override
  Color get paceNeutral => const Color(0xFF60A5FA);
  @override
  Color get paceWarning => const Color(0xFFF59E0B);
  @override
  Color get paceSlow => const Color(0xFFEF4444);

  // Pace semantic backgrounds
  @override
  Color get paceFastBg => const Color(0xFF0D2016);
  @override
  Color get paceNeutralBg => const Color(0xFF0D1625);
  @override
  Color get paceWarningBg => const Color(0xFF1F1608);
  @override
  Color get paceSlowBg => const Color(0xFF1F0D0D);

  // Actions
  @override
  Color get stopRed => const Color(0xFFEF4444);
}

class PaceUpLight extends PaceUpColors {
  const PaceUpLight();
  // Backgrounds
  @override
  Color get background => const Color(0xFFF5F5F0);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get surfaceElevated => const Color(0xFFFAFAFA);

  // Borders
  @override
  Color get border => const Color(0xFFE0E0DA);
  @override
  Color get divider => const Color(0xFFEBEBEB);

  // Text
  @override
  Color get textPrimary => const Color(0xFF111111);
  @override
  Color get textSecondary => const Color(0xFF777777);
  @override
  Color get textTertiary => const Color(0xFFAAAAAA);

  // Pace semantics
  @override
  Color get paceFast => const Color(0xFF16A34A);
  @override
  Color get paceNeutral => const Color(0xFF2563EB);
  @override
  Color get paceWarning => const Color(0xFFD97706);
  @override
  Color get paceSlow => const Color(0xFFDC2626);

  // Pace semantic backgrounds
  @override
  Color get paceFastBg => const Color(0xFFECFDF5);
  @override
  Color get paceNeutralBg => const Color(0xFFEFF6FF);
  @override
  Color get paceWarningBg => const Color(0xFFFFFBEB);
  @override
  Color get paceSlowBg => const Color(0xFFFEF2F2);

  // Actions
  @override
  Color get stopRed => const Color(0xFFDC2626);
}
