import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/model/five_days_data.dart';

class TempChart extends GetView<HomeController> {
  const TempChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Card(
        color: whiteColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        child: SfCartesianChart(
          primaryXAxis: const CategoryAxis(),
          series: <CartesianSeries<FiveDayData, String>>[
            SplineSeries<FiveDayData, String>(
              dataSource: controller.fiveDaysData,
              xValueMapper: (FiveDayData f, _) => f.dateTime,
              yValueMapper: (FiveDayData f, _) => f.temp,
            ),
          ],
        ),
      ),
    );
  }
}

