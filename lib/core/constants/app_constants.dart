import 'package:flutter/material.dart';

class AppColors {
  // Couleurs de dégradé (jour)
  static const dayGradientTop = Color(0xFF42A5F5); // blue.shade400
  static const dayGradientMiddle = Color(0xFF1976D2); // blue.shade700
  static const dayGradientBottom = Color(0xFF283593); // indigo.shade800

  // Couleurs de dégradé (nuit)
  static const nightGradientTop = Color(0xFF1A237E); // indigo.shade900
  static const nightGradientMiddle = Color(0xFF0D47A1); // blue.shade900
  static const nightGradientBottom = Color(0xFF01579B); // lightBlue.shade900

  // Couleurs de base
  static const white = Colors.white;
  static const transparent = Colors.transparent;
}

class AppSizes {
  // Padding & Margins
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 20.0;

  // Border radius
  static const double radiusSmall = 15.0;
  static const double radiusMedium = 20.0;
  static const double radiusLarge = 30.0;

  // Icon sizes
  static const double iconSmall = 24.0;
  static const double iconMedium = 32.0;
  static const double iconLarge = 100.0;

  // Font sizes
  static const double fontSmall = 14.0;
  static const double fontMedium = 16.0;
  static const double fontLarge = 24.0;
  static const double fontExtraLarge = 36.0;
  static const double fontHuge = 64.0;
}

class AppStrings {
  static const String appTitle = 'Météo App';
  static const String searchHint = 'Rechercher une ville...';
  static const String loading = 'Chargement...';
  static const String error = 'Erreur';
  static const String retry = 'Réessayer';
  static const String wind = 'Vent';
  static const String humidity = 'Humidité';
  static const String precipitation = 'Précipitations';
  static const String notAvailable = 'N/A';
}

class AppConstants {
  static const double opacityLight = 0.2;
  static const double opacityMedium = 0.3;
  static const double opacityHeavy = 0.7;
  static const double opacityFull = 0.8;

  static const String defaultCity = 'Paris';
  static const double defaultLatitude = 48.8566;
  static const double defaultLongitude = 2.3522;
}
