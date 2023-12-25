import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        iconTheme: const IconThemeData(
          size: 30,
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const WeatherScreenPage(),
    );
  }
}
