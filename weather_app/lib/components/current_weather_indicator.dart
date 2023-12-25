import 'dart:ui';

import 'package:flutter/material.dart';

class CurrentWeatherIndicator extends StatelessWidget {
  final String currentTempreture;
  final String currentSky;

  const CurrentWeatherIndicator({
    super.key,
    required this.currentTempreture,
    required this.currentSky,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth > 600 ? 500 : double.infinity,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$currentTempreture K',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Icon(
                        currentSky == 'Clouds' || currentSky == 'Rain'
                            ? Icons.cloud
                            : Icons.sunny,
                        size: 64,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        currentSky,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
