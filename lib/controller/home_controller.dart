// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:get/get.dart';
import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/model/five_days_data.dart';
import 'package:weather_app/services/weather_service.dart';

class HomeController extends GetxController {
  late String city;
  late String searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  HomeController({required this.city});

  @override
  void onInit() {
    initstate();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initstate();
  }

  void initstate() {
    getCurrentWeatherData();
  }

  void getCurrentWeatherData() {
    WeatherServices(city: city).getCurrentWeatherData(
      onSuccess: (data) {
        currentWeatherData = data;
        update();
      },
      onError: (error) {
        print(error);
        update();
      },
    );
  }

  void getTopFiveCities() {
    List<String> cities = [
      'Kathmandu',
      'Pokhara',
      'Birgunj',
      'Biratnagar',
      'Dhangadhi'
    ];
    /* for (var c in cities) {
      WeatherServices(city: c).getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    } */

    cities.forEach((c) {
      WeatherServices(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }

  /* void getFiveDaysData() {
    WeatherServices(city: city).getFiveDaysThreeHoursForecastData(
        onSuccess: (data) {
      fiveDaysData = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  } */
}
