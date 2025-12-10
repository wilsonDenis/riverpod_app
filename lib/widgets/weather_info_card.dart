import 'package:flutter/material.dart';
import 'package:riverpod_app/core/constants/app_constants.dart';

class WeatherInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: AppConstants.opacityLight),
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        border: Border.all(
          color: AppColors.white.withValues(alpha: AppConstants.opacityMedium),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.white, size: AppSizes.iconMedium),
          const SizedBox(height: AppSizes.paddingSmall),
          Text(
            label,
            style: TextStyle(
              color: AppColors.white.withValues(
                alpha: AppConstants.opacityFull,
              ),
              fontSize: AppSizes.fontSmall,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: AppSizes.fontMedium + 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
