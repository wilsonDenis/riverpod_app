import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_app/models/meteo.dart';

class MeteoController extends AsyncNotifier<Meteo> {
  static const _baseUrl = 'https://api.open-meteo.com/v1/forecast';
  static const _geocodingUrl = 'https://geocoding-api.open-meteo.com/v1/search';

  @override
  FutureOr<Meteo> build() {
    return Meteo(
      temperature: 0,
      windSpeed: 0,
      weatherCode: 0,
      time: DateTime.now().toString(),
      isDay: true,
    );
  }

  Future<void> getMeteo(double lat, double lon) async {
    state = const AsyncLoading();
    try {
      final url = Uri.parse(
        '$_baseUrl?latitude=$lat&longitude=$lon&current_weather=true&current=relative_humidity_2m,precipitation',
      );
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw 'Erreur lors de la récupération des données';
      }

      final meteo = Meteo.fromJson(jsonDecode(response.body));
      state = AsyncData(meteo);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  Future<void> getMeteoByCity(String cityName) async {
    if (cityName.trim().isEmpty) return;

    state = const AsyncLoading();
    try {
      
      final geocodingUri = Uri.parse(
        '$_geocodingUrl?name=${cityName.trim()}&count=1&language=fr&format=json',
      );
      final geocodingResponse = await http.get(geocodingUri);

      if (geocodingResponse.statusCode != 200) {
        throw 'Erreur lors de la recherche de la ville';
      }

      final geocodingData = jsonDecode(geocodingResponse.body);

      if (geocodingData['results'] == null ||
          geocodingData['results'].isEmpty) {
        throw 'Ville non trouvée';
      }

      final lat = (geocodingData['results'][0]['latitude'] as num).toDouble();
      final lon = (geocodingData['results'][0]['longitude'] as num).toDouble();


      await getMeteo(lat, lon);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
