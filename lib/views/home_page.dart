import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/core/constants/app_constants.dart';
import 'package:riverpod_app/providers/provider.dart';
import 'package:riverpod_app/widgets/weather_display.dart';
import 'package:riverpod_app/widgets/weather_search_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(meteoProvider.notifier).getMeteoByCity(AppConstants.defaultCity);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchCity() {
    final cityName = _searchController.text.trim();
    if (cityName.isNotEmpty) {
      ref.read(cityNameProvider.notifier).state = cityName;
      ref.read(meteoProvider.notifier).getMeteoByCity(cityName);
      FocusScope.of(context).unfocus();
    }
  }

  List<Color> _getGradientColors(bool isDay) {
    if (isDay) {
      return [
        AppColors.dayGradientTop,
        AppColors.dayGradientMiddle,
        AppColors.dayGradientBottom,
      ];
    }
    return [
      AppColors.nightGradientTop,
      AppColors.nightGradientMiddle,
      AppColors.nightGradientBottom,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final meteo = ref.watch(meteoProvider);
    final cityName = ref.watch(cityNameProvider);

    final gradientColors = meteo.when(
      data: (m) => _getGradientColors(m.isDay),
      loading: () => _getGradientColors(true),
      error: (_, __) => _getGradientColors(true),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                child: WeatherSearchBar(
                  controller: _searchController,
                  onSearch: _searchCity,
                ),
              ),
              Expanded(
                child: meteo.when(
                  data: (meteoData) => WeatherDisplay(
                    meteo: meteoData,
                    cityName: cityName,
                  ),
                  loading: () => const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 3,
                        ),
                        SizedBox(height: AppSizes.paddingLarge),
                        Text(
                          AppStrings.loading,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppSizes.fontMedium + 2,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  error: (error, _) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.paddingLarge),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: AppColors.white,
                            size: 60,
                          ),
                          const SizedBox(height: AppSizes.paddingLarge),
                          const Text(
                            AppStrings.error,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: AppSizes.fontLarge,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: AppSizes.paddingSmall),
                          Text(
                            error.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white.withValues(
                                alpha: AppConstants.opacityFull,
                              ),
                              fontSize: AppSizes.fontMedium,
                            ),
                          ),
                          const SizedBox(height: AppSizes.paddingLarge * 1.5),
                          ElevatedButton.icon(
                            onPressed: () => ref
                                .read(meteoProvider.notifier)
                                .getMeteoByCity(cityName),
                            icon: const Icon(Icons.refresh),
                            label: const Text(AppStrings.retry),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.paddingLarge * 1.5,
                                vertical: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
