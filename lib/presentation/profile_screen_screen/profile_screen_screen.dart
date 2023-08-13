import 'dart:math';

import 'package:meditation/presentation/profile_screen_screen/controller/profile_screen_controller.dart';
import 'package:meditation/core/app_export.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

import 'model/profile_screen_model.dart';

class ProfileScreen extends GetWidget<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Color(0xff4A80F0),
                    ),
                    Icon(
                      Icons.settings_outlined,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade800,
                ),
                child: const Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customText(
                text: "Natalia Lebediva",
                color: Colors.black,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              profileScreenCard(
                color: Colors.blue.shade800,
                title: "Practices",
                icon: Icons.book_outlined,
                key1: "Sessions",
                key2: "Time",
                val1: "13",
                val2: "4:23:04",
              ),
              profileScreenCard(
                color: Colors.pink.shade800,
                title: "Meditations",
                icon: Icons.timelapse,
                key1: "Sessions",
                key2: "Time",
                val1: "6",
                val2: "0:55:04",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: Get.height * 0.30,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          customText(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            text: "Stats",
                          ),
                          Spacer(),
                          customText(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            text: "Last Week",
                          ),
                          Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                statisticsTitle(
                                  color: Colors.blue.shade800,
                                  title: "Practices",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                statisticsTitle(
                                  color: Colors.pink.shade800,
                                  title: "Meditations",
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                statisticsTime(time: "0:43:05"),
                                const SizedBox(
                                  height: 5,
                                ),
                                statisticsTime(time: "0:15:45"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.15,
                        width: width,
                        child: _buildStackedColumnChart(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}

Widget profileScreenCard({
  required String title,
  required String key1,
  required String val1,
  required String key2,
  required String val2,
  required IconData icon,
  required Color color,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    child: Container(
      padding: const EdgeInsets.all(15),
      height: Get.height * 0.15,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              customText(
                text: title,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              customText(text: key1, color: Colors.grey),
              const SizedBox(
                width: 15,
              ),
              customText(text: val1, color: Colors.black, fontSize: 25),
              const Spacer(),
              customText(text: key2, color: Colors.grey),
              const SizedBox(
                width: 15,
              ),
              customText(text: val2, color: Colors.black, fontSize: 25),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget statisticsTitle({
  required Color color,
  required String title,
}) {
  return Row(
    children: [
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      const SizedBox(
        width: 10,
      ),
      customText(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        text: title,
      ),
    ],
  );
}

Widget statisticsTime({
  required String time,
}) {
  return Row(
    children: [
      Icon(
        Icons.timer_outlined,
        size: 17,
      ),
      const SizedBox(
        width: 10,
      ),
      customText(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        text: time,
      ),
    ],
  );
}

SfCartesianChart _buildStackedColumnChart() {
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 'Mon', y: _getRandomData(), yValue: _getRandomData()),
    ChartSampleData(x: 'Tue', y: _getRandomData(), yValue: _getRandomData()),
    ChartSampleData(x: 'Wed', y: _getRandomData(), yValue: _getRandomData()),
    ChartSampleData(x: 'Thu', y: _getRandomData(), yValue: _getRandomData()),
    ChartSampleData(x: 'Fri', y: _getRandomData(), yValue: _getRandomData()),
    ChartSampleData(x: 'Sat', y: _getRandomData(), yValue: _getRandomData()),
    ChartSampleData(x: 'Sun', y: _getRandomData(), yValue: _getRandomData()),
  ];

  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <ChartSeries<ChartSampleData, String>>[
      StackedColumnSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        width: 0.2,
        color: Colors.blue.shade800,
      ),
      StackedColumnSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.yValue,
        width: 0.2,
        color: Colors.pink.shade800,
      ),
    ],
  );
}

int _getRandomData() {
  final Random random = Random();
  return random.nextInt(100);
}
