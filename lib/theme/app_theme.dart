// THEME LOCK: light — source: domain signal (consumer marketplace, daytime outdoor use)
// Scaffold.backgroundColor = AppTheme.background — ALL screens

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Brand Colors ──────────────────────────────────────────────
  static const Color primary = Color(0xFF8B5E3C);
  static const Color primaryLight = Color(0xFFB07D56);
  static const Color primaryContainer = Color(0xFFF0E0CF);
  static const Color secondary = Color(0xFFD4874E);
  static const Color secondaryContainer = Color(0xFFFAE5D0);
  static const Color accent = Color(0xFF4A7C59);

  // ── Semantic Colors ───────────────────────────────────────────
  static const Color success = Color(0xFF4A7C59);
  static const Color warning = Color(0xFFC8822A);
  static const Color error = Color(0xFFB94040);

  // ── Light Theme Surfaces ──────────────────────────────────────
  static const Color surfaceLight = Color(0xFFFFFDF9);
  static const Color surfaceVariantLight = Color(0xFFF5EFE6);
  static const Color backgroundLight = Color(0xFFFAF6F0);
  static const Color onSurfaceLight = Color(0xFF2C1A0E);
  static const Color mutedLight = Color(0xFFA89880);
  static const Color outlineLight = Color(0xFFD4C4B0);
  static const Color outlineVariantLight = Color(0xFFEDE3D8);

  // ── Dark Theme Surfaces ───────────────────────────────────────
  static const Color surfaceDark = Color(0xFF1E1510);
  static const Color surfaceVariantDark = Color(0xFF2A1F17);
  static const Color backgroundDark = Color(0xFF130E09);
  static const Color onSurfaceDark = Color(0xFFF0E8DE);

  // ── Category Colors ───────────────────────────────────────────
  static const Color handicraftsColor = Color(0xFF8B5E3C);
  static const Color potteryColor = Color(0xFFC17A3A);
  static const Color clothingColor = Color(0xFF7A5C8A);
  static const Color organicFoodColor = Color(0xFF4A7C59);
  static const Color paintingsColor = Color(0xFF3A6B8A);
  static const Color homeDecorColor = Color(0xFFB85C4A);

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: primary,
      onPrimary: Colors.white,
      primaryContainer: primaryContainer,
      onPrimaryContainer: Color(0xFF3D1F08),
      secondary: secondary,
      onSecondary: Colors.white,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: Color(0xFF4A2500),
      surface: surfaceLight,
      onSurface: onSurfaceLight,
      surfaceContainerHighest: surfaceVariantLight,
      onSurfaceVariant: Color(0xFF6B5040),
      error: error,
      onError: Colors.white,
      outline: outlineLight,
      outlineVariant: outlineVariantLight,
      shadow: Color(0xFF8B5E3C).withAlpha(30),
      scrim: Color(0xFF000000),
    ),
    textTheme: GoogleFonts.dmSansTextTheme(
      TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: onSurfaceLight,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: onSurfaceLight,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: onSurfaceLight,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: onSurfaceLight,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: onSurfaceLight,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: onSurfaceLight,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: onSurfaceLight,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: onSurfaceLight,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: onSurfaceLight,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: onSurfaceLight,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: mutedLight,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: onSurfaceLight,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: onSurfaceLight,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
          color: mutedLight,
        ),
      ),
    ),
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: onSurfaceLight,
      ),
      iconTheme: IconThemeData(color: onSurfaceLight),
    ),
    cardTheme: CardThemeData(
      color: surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: false,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: outlineLight, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: outlineLight, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: error, width: 2),
      ),
      labelStyle: GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w500),
      hintStyle: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: mutedLight,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        textStyle: GoogleFonts.dmSans(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        side: BorderSide(color: primary, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        textStyle: GoogleFonts.dmSans(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surfaceLight,
      selectedColor: primary,
      labelStyle: GoogleFonts.dmSans(fontSize: 13, fontWeight: FontWeight.w500),
      side: BorderSide(color: outlineLight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),
    dividerTheme: DividerThemeData(
      color: outlineVariantLight,
      thickness: 1,
      space: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: primary,
      unselectedItemColor: mutedLight,
      selectedLabelStyle: GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: primaryLight,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFF4A2E18),
      onPrimaryContainer: Color(0xFFF0D5BE),
      secondary: secondary,
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFF4A2E10),
      onSecondaryContainer: Color(0xFFF5D5B0),
      surface: surfaceDark,
      onSurface: onSurfaceDark,
      surfaceContainerHighest: surfaceVariantDark,
      onSurfaceVariant: Color(0xFFB0957A),
      error: Color(0xFFCF7070),
      onError: Colors.white,
      outline: Color(0xFF5A4030),
      outlineVariant: Color(0xFF3A2818),
    ),
    textTheme: GoogleFonts.dmSansTextTheme(
      TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: onSurfaceDark,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: onSurfaceDark,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: onSurfaceDark,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: onSurfaceDark,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: onSurfaceDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: onSurfaceDark,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: onSurfaceDark,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF8A7060),
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: onSurfaceDark,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: onSurfaceDark,
        ),
      ),
    ),
    scaffoldBackgroundColor: backgroundDark,
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    cardTheme: CardThemeData(
      color: surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );

  // ── Utility Methods ───────────────────────────────────────────
  static Color categoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'handicrafts':
        return handicraftsColor;
      case 'pottery':
        return potteryColor;
      case 'clothing':
        return clothingColor;
      case 'organic food':
        return organicFoodColor;
      case 'paintings':
        return paintingsColor;
      case 'home decor':
        return homeDecorColor;
      default:
        return primary;
    }
  }

  static BoxShadow get softShadow => BoxShadow(
    color: Color(0xFF8B5E3C).withAlpha(20),
    blurRadius: 16,
    offset: Offset(0, 4),
    spreadRadius: 0,
  );

  static BoxShadow get mediumShadow => BoxShadow(
    color: Color(0xFF8B5E3C).withAlpha(28),
    blurRadius: 24,
    offset: Offset(0, 8),
    spreadRadius: 0,
  );
}