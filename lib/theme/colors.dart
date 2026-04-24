import 'dart:ui';

abstract class PaceUpDark {
  // Backgrounds
  static const background      = Color(0xFF0D0D0D);
  static const surface         = Color(0xFF1A1A1A);
  static const surfaceElevated = Color(0xFF232323);
 
  // Borders
  static const border          = Color(0xFF2A2A2A);
  static const divider         = Color(0xFF1C1C1C);
 
  // Text
  static const textPrimary     = Color(0xFFF0F0F0);
  static const textSecondary   = Color(0xFF888888);
  static const textTertiary    = Color(0xFF444444);
 
  // Pace semantics
  static const paceFast        = Color(0xFF22C55E);
  static const paceNeutral     = Color(0xFF60A5FA);
  static const paceWarning     = Color(0xFFF59E0B);
  static const paceSlow        = Color(0xFFEF4444);
 
  // Pace semantic backgrounds (status chips / row highlights)
  static const paceFastBg      = Color(0xFF0D2016);
  static const paceNeutralBg   = Color(0xFF0D1625);
  static const paceWarningBg   = Color(0xFF1F1608);
  static const paceSlowBg      = Color(0xFF1F0D0D);
 
  // Actions
  static const stopRed         = Color(0xFFEF4444);
}
 
abstract class PaceUpLight {
  // Backgrounds
  static const background      = Color(0xFFF5F5F0);
  static const surface         = Color(0xFFFFFFFF);
  static const surfaceElevated = Color(0xFFFAFAFA);
 
  // Borders
  static const border          = Color(0xFFE0E0DA);
  static const divider         = Color(0xFFEBEBEB);
 
  // Text
  static const textPrimary     = Color(0xFF111111);
  static const textSecondary   = Color(0xFF777777);
  static const textTertiary    = Color(0xFFAAAAAA);
 
  // Pace semantics — one stop darker than dark-mode values for legibility on white
  static const paceFast        = Color(0xFF16A34A);
  static const paceNeutral     = Color(0xFF2563EB);
  static const paceWarning     = Color(0xFFD97706);
  static const paceSlow        = Color(0xFFDC2626);
 
  // Pace semantic backgrounds
  static const paceFastBg      = Color(0xFFECFDF5);
  static const paceNeutralBg   = Color(0xFFEFF6FF);
  static const paceWarningBg   = Color(0xFFFFFBEB);
  static const paceSlowBg      = Color(0xFFFEF2F2);
 
  // Actions
  static const stopRed         = Color(0xFFDC2626);
}
