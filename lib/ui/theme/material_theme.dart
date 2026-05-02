// ─────────────────────────────────────────────────────────────────────────────
// Material ThemeData — Dark
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:pace_up/ui/theme/colors.dart';
import 'package:pace_up/ui/theme/dimensions.dart';
import 'package:pace_up/ui/theme/typography.dart';

ThemeData paceUpMaterialDark() {
  final darkThemeColors = PaceUpDark();
  final cs =
      ColorScheme.fromSeed(
        seedColor: darkThemeColors.paceFast,
        brightness: Brightness.dark,
      ).copyWith(
        surface: darkThemeColors.surface,
        onSurface: darkThemeColors.textPrimary,
        surfaceContainerHighest: darkThemeColors.surfaceElevated,
        outline: darkThemeColors.border,
        primary: darkThemeColors.paceFast,
        onPrimary: darkThemeColors.background,
        error: darkThemeColors.paceSlow,
        onError: darkThemeColors.textPrimary,
      );

  return ThemeData(
    useMaterial3: true,
    colorScheme: cs,
    scaffoldBackgroundColor: darkThemeColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: darkThemeColors.background,
      foregroundColor: darkThemeColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: darkThemeColors.textPrimary,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: darkThemeColors.border,
      thickness: PaceUpSpacing.dividerWidth,
      space: 0,
    ),
    cardTheme: CardThemeData(
      color: darkThemeColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PaceUpRadius.card),
        side: BorderSide(color: darkThemeColors.border, width: 0.5),
      ),
      margin: EdgeInsets.zero,
    ),
    iconTheme: IconThemeData(color: darkThemeColors.textSecondary, size: 20),
    textTheme:
        TextTheme(
          displayLarge: PaceUpTextStyles.paceHero,
          titleMedium: PaceUpTextStyles.metricValue,
          bodySmall: PaceUpTextStyles.splitRow,
          labelSmall: PaceUpTextStyles.label,
        ).apply(
          bodyColor: darkThemeColors.textPrimary,
          displayColor: darkThemeColors.textPrimary,
        ),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.transparent,
      textColor: darkThemeColors.textPrimary,
      minVerticalPadding: 8,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkThemeColors.surface,
      selectedItemColor: darkThemeColors.paceFast,
      unselectedItemColor: darkThemeColors.textTertiary,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: darkThemeColors.surface,
      indicatorColor: darkThemeColors.paceFastBg,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: darkThemeColors.paceFast, size: 22);
        }
        return IconThemeData(color: darkThemeColors.textTertiary, size: 22);
      }),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: darkThemeColors.surfaceElevated,
      contentTextStyle: TextStyle(
        color: darkThemeColors.textPrimary,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PaceUpRadius.small),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// Material ThemeData — Light
// ─────────────────────────────────────────────────────────────────────────────

ThemeData paceUpMaterialLight() {
  final lightThemeColors = PaceUpLight();
  final cs =
      ColorScheme.fromSeed(
        seedColor: lightThemeColors.paceFast,
        brightness: Brightness.light,
      ).copyWith(
        surface: lightThemeColors.surface,
        onSurface: lightThemeColors.textPrimary,
        surfaceContainerHighest: lightThemeColors.surfaceElevated,
        outline: lightThemeColors.border,
        primary: lightThemeColors.paceFast,
        onPrimary: Colors.white,
        error: lightThemeColors.paceSlow,
        onError: Colors.white,
      );

  return ThemeData(
    useMaterial3: true,
    colorScheme: cs,
    scaffoldBackgroundColor: lightThemeColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: lightThemeColors.surface,
      foregroundColor: lightThemeColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      shadowColor: Color(0x0A000000),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: lightThemeColors.textPrimary,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: lightThemeColors.divider,
      thickness: PaceUpSpacing.dividerWidth,
      space: 0,
    ),
    cardTheme: CardThemeData(
      color: lightThemeColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PaceUpRadius.card),
        side: BorderSide(color: lightThemeColors.border, width: 0.5),
      ),
      margin: EdgeInsets.zero,
    ),
    iconTheme: IconThemeData(color: lightThemeColors.textSecondary, size: 20),
    textTheme:
        TextTheme(
          displayLarge: PaceUpTextStyles.paceHero,
          titleMedium: PaceUpTextStyles.metricValue,
          bodySmall: PaceUpTextStyles.splitRow,
          labelSmall: PaceUpTextStyles.label,
        ).apply(
          bodyColor: lightThemeColors.textPrimary,
          displayColor: lightThemeColors.textPrimary,
        ),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.transparent,
      textColor: lightThemeColors.textPrimary,
      minVerticalPadding: 8,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightThemeColors.surface,
      selectedItemColor: lightThemeColors.paceFast,
      unselectedItemColor: lightThemeColors.textTertiary,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: lightThemeColors.surface,
      indicatorColor: lightThemeColors.paceFastBg,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: lightThemeColors.paceFast, size: 22);
        }
        return IconThemeData(color: lightThemeColors.textTertiary, size: 22);
      }),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: lightThemeColors.surfaceElevated,
      contentTextStyle: TextStyle(
        color: lightThemeColors.textPrimary,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PaceUpRadius.small),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
