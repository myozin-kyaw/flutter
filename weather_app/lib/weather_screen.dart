import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_information_widget.dart';
import 'package:weather_app/hourly_forecast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
              if (kDebugMode) {
                print('refresh...');
              }
            },
            icon: const Icon(Icons.refresh),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '0°C',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Cloudy',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Weather Forecast',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: '9:00',
                    icon: Icons.cloud,
                    tempreture: '301.1',
                  ),
                  HourlyForecastItem(
                    time: '9:00',
                    icon: Icons.sunny,
                    tempreture: '301.1',
                  ),
                  HourlyForecastItem(
                    time: '10:00',
                    icon: Icons.snowing,
                    tempreture: '301.1',
                  ),
                  HourlyForecastItem(
                    time: '11:00',
                    icon: Icons.snowing,
                    tempreture: '301.1',
                  ),
                  HourlyForecastItem(
                    time: '12:00',
                    icon: Icons.snowing,
                    tempreture: '301.1',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Additional Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInformationWidget(
                  icon: Icons.water_drop,
                  title: 'Humdity',
                  value: '94',
                ),
                AdditionalInformationWidget(
                  icon: Icons.air,
                  title: 'Wind Speed',
                  value: '7.67',
                ),
                AdditionalInformationWidget(
                  icon: Icons.beach_access,
                  title: 'Pressure',
                  value: '1005',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
