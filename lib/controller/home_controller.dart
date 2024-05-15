// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/services/weather_service.dart';

class HomeController extends GetxController {
  late String city;
  late String searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();

  HomeController({required this.city});

  @override
  void onInit() {
    initstate();
    super.onInit();
  }

  void updateWeather() {
    initstate();
  }

  void initstate() {
    WeatherServices(city: city).getCurrentWeatherData(onSuccess: (data) {
      currentWeatherData = data;
      update();
    });
  }
}
