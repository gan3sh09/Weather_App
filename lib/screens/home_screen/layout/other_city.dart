import 'package:flutter/material.dart';
import 'package:weather_app/constants/image_string.dart';
import 'package:weather_app/model/current_weather_data.dart';

class OtherCity extends StatelessWidget {
  const OtherCity({
    super.key,
    required this.data,
  });

  final CurrentWeatherData? data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (data != null) ? '${data?.name}' : '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
            ),
            Text(
              (data != null)
                  ? '${(data!.main!.temp! - 273.15).round().toString()}\u2103'
                  : '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(iconWeather),
                ),
              ),
            ),
            Text(
              (data != null) ? '${data?.weather?[0].description}' : '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black45,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}