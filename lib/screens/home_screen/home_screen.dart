import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/constants/image_string.dart';
import 'package:weather_app/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        builder: (controller) => Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(blueSky),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 80,
                        left: 20,
                        right: 20,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          controller.city = value;
                        },
                        style: const TextStyle(color: whiteColor),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {
                          controller.updateWeather();
                        },
                        decoration: InputDecoration(
                          suffix: IconButton(
                            onPressed: () {
                              controller.updateWeather();
                            },
                            icon: const Icon(
                              Icons.search,
                              color: whiteColor,
                            ),
                          ),
                          hintText: 'SEARCH',
                          hintStyle: const TextStyle(color: whiteColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: whiteColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: whiteColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: whiteColor),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.0, 1.0),
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 0,
                          maxHeight: MediaQuery.of(context).size.height / 3.5,
                          child: Stack(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  color: whiteColor,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                // ignore: unnecessary_null_comparison
                                                (controller.currentWeatherData !=
                                                        null)
                                                    ? '${controller.currentWeatherData.name}'
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Roboto',
                                                    ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                DateFormat()
                                                    .add_MMMMEEEEd()
                                                    .format(
                                                      DateTime.now(),
                                                    ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Roboto',
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 50),
                                            child: Column(
                                              children: [
                                                Text(
                                                  (controller.currentWeatherData
                                                              .weather !=
                                                          null)
                                                      ? '${controller.currentWeatherData.weather?[0].description}'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Roboto',
                                                      ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  (controller.currentWeatherData
                                                              .main !=
                                                          null)
                                                      ? '${(controller.currentWeatherData.main!.temp! - 274.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                        color: Colors.black45,
                                                        fontFamily: 'Roboto',
                                                      ),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData
                                                              .main !=
                                                          null)
                                                      ? 'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Roboto',
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              right: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 120,
                                                  height: 120,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          iconWeather),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData
                                                              .wind !=
                                                          null)
                                                      ? 'wind ${controller.currentWeatherData.wind?.speed} m/s'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Roboto',
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
