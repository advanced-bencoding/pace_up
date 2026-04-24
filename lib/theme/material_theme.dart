// ─────────────────────────────────────────────────────────────────────────────
// Material ThemeData — Dark
// ─────────────────────────────────────────────────────────────────────────────
 
import 'package:flutter/material.dart';
import 'package:pace_up/theme/colors.dart';
import 'package:pace_up/theme/dimensions.dart';
import 'package:pace_up/theme/typography.dart';

ThemeData paceUpMaterialDark() {
  final cs = ColorScheme.fromSeed(
    seedColor: PaceUpDark.paceFast,
    brightness: Brightness.dark,
  ).copyWith(
    surface: PaceUpDark.surface,
    onSurface: PaceUpDark.textPrimary,
    surfaceContainerHighest: PaceUpDark.surfaceElevated,
    outline: PaceUpDark.border,
    primary: PaceUpDark.paceFast,
    onPrimary: PaceUpDark.background,
    error: PaceUpDark.paceSlow,
    onError: PaceUpDark.textPrimary,
  );
 
  return ThemeData(
    useMaterial3: true,
    colorScheme: cs,
    scaffoldBackgroundColor: PaceUpDark.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: PaceUpDark.background,
      foregroundColor: PaceUpDark.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: PaceUpDark.textPrimary,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: PaceUpDark.border,
      thickness: PaceUpSpacing.dividerWidth,
      space: 0,
    ),
    cardTheme: CardThemeData(
      color: PaceUpDark.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PaceUpRadius.card),
        side: const BorderSide(color: PaceUpDark.border, width: 0.5),
      ),
      margin: EdgeInsets.zero,
    ),
    iconTheme: const IconThemeData(
      color: PaceUpDark.textSecondary,
      size: 20,
    ),
    textTheme: TextTheme(
      displayLarge: PaceUpTextStyles.paceHero,
      titleMedium: PaceUpTextStyles.metricValue,
      bodySmall: PaceUpTextStyles.splitRow,
      labelSmall: PaceUpTextStyles.label,
    ).apply(
      bodyColor: PaceUpDark.textPrimary,
      displayColor: PaceUpDark.textPrimary,
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.transparent,
      textColor: PaceUpDark.textPrimary,
      minVerticalPadding: 8,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: PaceUpDark.surface,
      selectedItemColor: PaceUpDark.paceFast,
      unselectedItemColor: PaceUpDark.textTertiary,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: PaceUpDark.surface,
      indicatorColor: PaceUpDark.paceFastBg,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: PaceUpDark.paceFast, size: 22);
        }
        return const IconThemeData(color: PaceUpDark.textTertiary, size: 22);
      }),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: PaceUpDark.surfaceElevated,
      contentTextStyle: const TextStyle(color: PaceUpDark.textPrimary, fontSize: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PaceUpRadius.small)),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
 
// ─────────────────────────────────────────────────────────────────────────────
// Material ThemeData — Light
// ─────────────────────────────────────────────────────────────────────────────
 
ThemeData paceUpMaterialLight() {
  final cs = ColorScheme.fromSeed(
    seedColor: PaceUpLight.paceFast,
    brightness: Brightness.light,
  ).copyWith(
    surface: PaceUpLight.surface,
    onSurface: PaceUpLight.textPrimary,
    surfaceContainerHighest: PaceUpLight.surfaceElevated,
    outline: PaceUpLight.border,
    primary: PaceUpLight.paceFast,
    onPrimary: Colors.white,
    error: PaceUpLight.paceSlow,
    onError: Colors.white,
  );
 
  return ThemeData(
    useMaterial3: true,
    colorScheme: cs,
    scaffoldBackgroundColor: PaceUpLight.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: PaceUpLight.surface,
      foregroundColor: PaceUpLight.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      shadowColor: Color(0x0A000000),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: PaceUpLight.textPrimary,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: PaceUpLight.divider,
      thickness: PaceUpSpacing.dividerWidth,
      space: 0,
    ),
    cardTheme: CardThemeData(
      color: PaceUpLight.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PaceUpRadius.card),
        side: const BorderSide(color: PaceUpLight.border, width: 0.5),
      ),
      margin: EdgeInsets.zero,
    ),
    iconTheme: const IconThemeData(
      color: PaceUpLight.textSecondary,
      size: 20,
    ),
    textTheme: TextTheme(
      displayLarge: PaceUpTextStyles.paceHero,
      titleMedium: PaceUpTextStyles.metricValue,
      bodySmall: PaceUpTextStyles.splitRow,
      labelSmall: PaceUpTextStyles.label,
    ).apply(
      bodyColor: PaceUpLight.textPrimary,
      displayColor: PaceUpLight.textPrimary,
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.transparent,
      textColor: PaceUpLight.textPrimary,
      minVerticalPadding: 8,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: PaceUpLight.surface,
      selectedItemColor: PaceUpLight.paceFast,
      unselectedItemColor: PaceUpLight.textTertiary,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: PaceUpLight.surface,
      indicatorColor: PaceUpLight.paceFastBg,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: PaceUpLight.paceFast, size: 22);
        }
        return const IconThemeData(color: PaceUpLight.textTertiary, size: 22);
      }),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: PaceUpLight.surfaceElevated,
      contentTextStyle: const TextStyle(color: PaceUpLight.textPrimary, fontSize: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PaceUpRadius.small)),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
