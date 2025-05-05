import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/developer_screen.dart';
import 'cubit/daylight_cubit.dart';
import 'screens/daylight_calculator_screen.dart';
import 'rerpositories/weather_repository.dart';
import 'cubit/weather_cubit.dart';
import 'screens/weather_screen.dart';
import 'screens//camera_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherCubit(
            WeatherRepositoryImpl(),
          )..loadHistory(),
        ),
        BlocProvider(
          create: (context) => DaylightCubit()..loadHistory(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const WeatherPage(),
          '/developer': (context) => const DeveloperPage(),
          '/daylight': (context) => const DaylightCalculatorPage(),
          '/camera': (context) => const CameraPage(),
        },
      ),
    );
  }
}