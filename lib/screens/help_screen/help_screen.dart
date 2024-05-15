import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/constants/image_string.dart';
import 'package:weather_app/screens/home_screen/home_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.13,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(splashBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              // skip text button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              // heading text
              const Text(
                'We show weather for you',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                  letterSpacing: 1,
                ),
              ),

              SizedBox(
                height: screenHeight * 0.13,
              ),
              // image
              Image(
                image: const AssetImage(iconWeather),
                height: size.height * 0.35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
