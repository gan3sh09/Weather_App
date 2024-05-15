// ignore_for_file: avoid_print

import 'package:weather_app/api/api_repository.dart';
import 'package:weather_app/model/current_weather_data.dart';

class WeatherServices {
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=48e61d37e600fe1869ff4eea8542725e';

  WeatherServices({required this.city});

  // https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=48e61d37e600fe1869ff4eea8542725e

  void getCurrentWeatherData({
    Function? beforeSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    ApiRepository(url: url, payload: {}).get(
      beforeSend: beforeSend,
      onSuccess: (data) {
        onSuccess!(CurrentWeatherData.fromJson(data));
      },
      onError: (error) {
        if (onError != null) {
          print(error);
          onError(error);
        }
      },
    );
  }

  void getTopFiveCities({
    Function? beforeSend,
    Function(dynamic currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/top-five-cities'; // Adjust the URL as per your API endpoint
    ApiRepository(url: url, payload: {}).get(
      beforeSend: beforeSend,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  void getFiveDaysThreeHoursForecastData({
    Function? beforeSend,
    Function(dynamic currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/five-days-forecast'; // Adjust the URL as per your API endpoint
    ApiRepository(url: url, payload: {}).get(
      beforeSend: beforeSend,
      onSuccess: onSuccess,
      onError: onError,
    );
  }
}
