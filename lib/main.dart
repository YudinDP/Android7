import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'models/weather_model.dart';
import 'models/daylight_model.dart';
import 'models/duration_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  
  Hive.registerAdapter(WeatherModelAdapter());
  Hive.registerAdapter(DaylightModelAdapter());
  Hive.registerAdapter(DurationAdapter());
  
  await Hive.openBox<WeatherModel>('weather_history');
  await Hive.openBox<DaylightModel>('daylight_history');
  
  runApp(const WeatherApp());
}