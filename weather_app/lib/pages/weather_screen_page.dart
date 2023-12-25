import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/components/additional_information_widget.dart';
import 'package:weather_app/components/current_weather_indicator.dart';
import 'package:weather_app/components/hourly_forecast_item.dart';
import 'package:weather_app/openweather_secret_key.dart';

class WeatherScreenPage extends StatefulWidget {
  const WeatherScreenPage({super.key});

  @override
  State<WeatherScreenPage> createState() => _WeatherScreenPageState();
}

class _WeatherScreenPageState extends State<WeatherScreenPage> {
  late Future<Map<String, dynamic>> weather;

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    String name = 'Yangon';
    try {
      final result = await http.get(
        Uri.parse(
          'http://api.openweathermap.org/data/2.5/forecast?q=$name&APPID=$openWeatherSecretKey',
        ),
      );

      final data = jsonDecode(result.body);

      if (data['cod'] != '200') {
        throw data['message'];
      }

      return data;
    } catch (exception) {
      throw exception.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
            icon: const Icon(Icons.refresh),
          )
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.redAccent),
              ),
            );
          }

          final data = snapshot.data!;
          final currentWeather = data['list'][0];
          final currentTempreture = currentWeather['main']['temp'];
          final currentSky = currentWeather['weather'][0]['main'];
          final humidity = currentWeather['main']['humidity'];
          final windSpeed = currentWeather['wind']['speed'];
          final pressure = currentWeather['main']['pressure'];

          return LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: constraints.maxWidth > 600
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    CurrentWeatherIndicator(
                      currentTempreture: currentTempreture.toString(),
                      currentSky: currentSky,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Weather Forecast',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      height: 120,
                      width: 600,
                      alignment: Alignment.center,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final hourlyForecast = data['list'][index + 1];
                            final time =
                                DateTime.parse(hourlyForecast['dt_txt']);
                            return HourlyForecastItem(
                              time: DateFormat.Hm().format(time),
                              icon: hourlyForecast['weather'][0]['main'] ==
                                          'Clouds' ||
                                      hourlyForecast['weather'][0]['main'] ==
                                          'Rain'
                                  ? Icons.cloud
                                  : Icons.sunny,
                              tempreture:
                                  hourlyForecast['main']['temp'].toString(),
                            );
                          }),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Additional Information',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: constraints.maxWidth > 600
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalInformationWidget(
                          icon: Icons.water_drop,
                          title: 'Humdity',
                          value: humidity.toString(),
                        ),
                        AdditionalInformationWidget(
                          icon: Icons.air,
                          title: 'Wind Speed',
                          value: windSpeed.toString(),
                        ),
                        AdditionalInformationWidget(
                          icon: Icons.beach_access,
                          title: 'Pressure',
                          value: pressure.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
