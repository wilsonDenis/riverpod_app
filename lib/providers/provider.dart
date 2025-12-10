import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_app/controllers/meteo_controller.dart';
import 'package:riverpod_app/models/meteo.dart';
import 'package:riverpod_app/core/constants/app_constants.dart';

final meteoProvider = AsyncNotifierProvider<MeteoController, Meteo>(
  () => MeteoController(),
);

final cityNameProvider = StateProvider<String>(
  (ref) => AppConstants.defaultCity,
);
