import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(String city);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final String apiKey = '5c701dc37183946286c9b83a83cefb3f';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  @override
  Future<WeatherModel> getWeather(String city) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?q=${Uri.encodeComponent(city)}&appid=$apiKey&units=metric'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['cod'] != 200) {
          throw Exception(data['message'] ?? 'Unknown error');
        }
        return WeatherModel(
          city: city,
          temperature: data['main']['temp'].toDouble(),
          description: data['weather'][0]['description'],
          date: DateTime.now(),
        );
      } else {
        throw Exception('HTTP Error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get weather: ${e.toString()}');
    }
  }
}