import 'package:flutter/material.dart';
import 'package:riverpod_app/core/constants/app_constants.dart';
import 'package:riverpod_app/models/meteo.dart';
import 'package:riverpod_app/widgets/weather_info_card.dart';

class WeatherDisplay extends StatelessWidget {
  final Meteo meteo;
  final String cityName;

  const WeatherDisplay({
    super.key,
    required this.meteo,
    required this.cityName,
  });

  String _formatDate(String dateTimeStr) {
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      const months = [
        'janvier',
        'février',
        'mars',
        'avril',
        'mai',
        'juin',
        'juillet',
        'août',
        'septembre',
        'octobre',
        'novembre',
        'décembre',
      ];
      const weekdays = [
        'lundi',
        'mardi',
        'mercredi',
        'jeudi',
        'vendredi',
        'samedi',
        'dimanche',
      ];
      return '${weekdays[dateTime.weekday - 1]} ${dateTime.day} ${months[dateTime.month - 1]}';
    } catch (e) {
      return dateTimeStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 700;

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth > 600
              ? AppSizes.paddingLarge * 2
              : AppSizes.paddingLarge,
          vertical: isSmallScreen
              ? AppSizes.paddingSmall
              : AppSizes.paddingMedium,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ville
            Text(
              cityName,
              style: TextStyle(
                color: AppColors.white,
                fontSize: isSmallScreen ? 28 : AppSizes.fontExtraLarge,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: isSmallScreen ? 4 : 8),

            // Date
            Text(
              _formatDate(meteo.time),
              style: TextStyle(
                color: AppColors.white.withValues(
                  alpha: AppConstants.opacityFull,
                ),
                fontSize: AppSizes.fontMedium,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: isSmallScreen ? 16 : 24),

            // Icône météo
            Text(
              meteo.weatherIcon,
              style: TextStyle(
                fontSize: isSmallScreen ? 80 : AppSizes.iconLarge,
              ),
            ),
            SizedBox(height: isSmallScreen ? 8 : 16),

            // Température
            Text(
              '${meteo.temperature.toStringAsFixed(1)}°C',
              style: TextStyle(
                color: AppColors.white,
                fontSize: isSmallScreen ? 48 : AppSizes.fontHuge,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: isSmallScreen ? 4 : 8),

            // Description
            Text(
              meteo.weatherDescription,
              style: TextStyle(
                color: AppColors.white,
                fontSize: isSmallScreen ? 18 : AppSizes.fontLarge,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: isSmallScreen ? 20 : 32),

            // Cartes d'info
            Wrap(
              spacing: AppSizes.paddingMedium,
              runSpacing: AppSizes.paddingMedium,
              alignment: WrapAlignment.center,
              children: [
                WeatherInfoCard(
                  icon: Icons.air,
                  label: AppStrings.wind,
                  value: '${meteo.windSpeed.toStringAsFixed(1)} km/h',
                ),
                WeatherInfoCard(
                  icon: Icons.water_drop,
                  label: AppStrings.humidity,
                  value: meteo.humidity != null
                      ? '${meteo.humidity!.toStringAsFixed(0)}%'
                      : AppStrings.notAvailable,
                ),
                if (meteo.precipitation != null && meteo.precipitation! > 0)
                  WeatherInfoCard(
                    icon: Icons.umbrella,
                    label: AppStrings.precipitation,
                    value: '${meteo.precipitation!.toStringAsFixed(1)} mm',
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
