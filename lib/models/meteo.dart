class Meteo {
  final double temperature;
  final double windSpeed;
  final int weatherCode;
  final String time;
  final double? humidity;
  final double? precipitation;
  final bool isDay;

  Meteo({
    required this.temperature,
    required this.windSpeed,
    required this.weatherCode,
    required this.time,
    required this.isDay,
    this.humidity,
    this.precipitation,
  });

  factory Meteo.fromJson(Map<String, dynamic> json) {
    final currentWeather = json['current_weather'];
    return Meteo(
      temperature: (currentWeather['temperature'] as num).toDouble(),
      windSpeed: (currentWeather['windspeed'] as num).toDouble(),
      weatherCode: currentWeather['weathercode'] as int,
      time: currentWeather['time'] as String,
      isDay: (currentWeather['is_day'] as int) == 1,
      humidity: json['current']?['relative_humidity_2m']?.toDouble(),
      precipitation: json['current']?['precipitation']?.toDouble(),
    );
  }

  String get weatherDescription {
    const descriptions = {
      0: 'Ciel dégagé',
      1: 'Partiellement nuageux',
      2: 'Partiellement nuageux',
      3: 'Partiellement nuageux',
      45: 'Brouillard',
      48: 'Brouillard',
      51: 'Bruine',
      53: 'Bruine',
      55: 'Bruine',
      61: 'Pluie',
      63: 'Pluie',
      65: 'Pluie',
      71: 'Neige',
      73: 'Neige',
      75: 'Neige',
      77: 'Grésil',
      80: 'Averses',
      81: 'Averses',
      82: 'Averses',
      85: 'Averses de neige',
      86: 'Averses de neige',
      95: 'Orage',
      96: 'Orage avec grêle',
      99: 'Orage avec grêle',
    };
    return descriptions[weatherCode] ?? 'Non disponible';
  }

  String get weatherIcon {

    if (weatherCode == 0) {
      return isDay ? '☀️' : '🌙';
    }

    const icons = {
      1: '⛅',
      2: '⛅',
      3: '⛅',
      45: '🌫️',
      48: '🌫️',
      51: '🌧️',
      53: '🌧️',
      55: '🌧️',
      61: '🌧️',
      63: '🌧️',
      65: '🌧️',
      71: '❄️',
      73: '❄️',
      75: '❄️',
      77: '❄️',
      80: '🌦️',
      81: '🌦️',
      82: '🌦️',
      85: '🌨️',
      86: '🌨️',
      95: '⛈️',
      96: '⛈️',
      99: '⛈️',
    };
    return icons[weatherCode] ?? '🌡️';
  }
}
