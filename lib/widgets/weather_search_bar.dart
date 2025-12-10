import 'package:flutter/material.dart';
import 'package:riverpod_app/core/constants/app_constants.dart';

class WeatherSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const WeatherSearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: AppConstants.opacityLight),
        borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
        border: Border.all(
          color: AppColors.white.withValues(alpha: AppConstants.opacityMedium),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          hintText: AppStrings.searchHint,
          hintStyle: TextStyle(
            color: AppColors.white.withValues(alpha: AppConstants.opacityHeavy),
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.white),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send, color: AppColors.white),
            onPressed: onSearch,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingLarge,
            vertical: 15,
          ),
        ),
        onSubmitted: (_) => onSearch(),
      ),
    );
  }
}
