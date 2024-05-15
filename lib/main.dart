import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/home_binding.dart';
import 'package:weather_app/screens/help_screen/help_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HelpScreen(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
