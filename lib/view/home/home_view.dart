import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/common_widget/workout_row.dart';
import 'package:flutter_application_1/view/home/activity_tracker_view.dart';
import 'package:flutter_application_1/view/home/finished_workout_view.dart';
import 'package:flutter_application_1/view/home/notification_view.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

List waterArr = [
  {"title": "6am - 8am", "subtitle": "600ml"},
  {"title": "9am - 11am", "subtitle": "500ml"},
  {"title": "11am - 2pm", "subtitle": "1000ml"},
  {"title": "2pm - 4pm", "subtitle": "700ml"},
  {"title": "4pm - now", "subtitle": "900ml"},
];

List<PieChartSectionData> showingSections() {
  return List.generate(2, (i) {
    var color0 = TColor.secondaryColor1;

    switch (i) {
      case 0:
        return PieChartSectionData(
          color: color0,
          value: 33,
          title: '',
          radius: 55,
          titlePositionPercentageOffset: 0.55,
          badgeWidget: const Text(
            "20,1",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      case 1:
        return PieChartSectionData(
          color: Colors.white,
          value: 75,
          title: '',
          radius: 45,
          titlePositionPercentageOffset: 0.55,
        );

      default:
        throw Error();
    }
  });
}

LineChartData sampleData() {
  // 定义星期几的列表
  final List<String> weekdays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];
  // 定义百分比列表
  final List<String> percents = ["0*", "20%", "40%", "60%", "80%", "100%"];

  return LineChartData(
    lineBarsData: [
      LineChartBarData(
        isCurved: true,
        color: TColor.brandColor1,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 60),
        ],
      ),
    ],
    minX: 1,
    maxX: 7, // 调整为 7 以匹配周一到周日的范围
    maxY: 100,
    minY: 0,
    titlesData: FlTitlesData(
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            // 更精确地映射 value 到百分比列表的索引
            int index = (value / (100) * (percents.length - 1)).round();
            // 添加边界检查
            index = index.clamp(0, percents.length - 1);
            return Text(
              percents[index],
              style: TextStyle(color: TColor.greyColor1, fontSize: 10),
            );
          },
          interval: 100 / (percents.length - 1), // 调整间隔以匹配百分比列表
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return Text(
              weekdays[value.toInt() - 1],
              style: TextStyle(color: TColor.greyColor1),
            );
          },
          interval: 1, // 间隔为 1 以确保每个值都显示
        ),
      ),
    ),
    gridData: FlGridData(
      show: true,
      drawHorizontalLine: true,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: TColor.greyColor1.withValues(alpha: 0.2),
          strokeWidth: 1,
        );
      },
    ),
    borderData: FlBorderData(
      show: true,
      border: Border(
        top: BorderSide(
          color: TColor.greyColor1.withValues(alpha: 0.2),
          width: 1,
        ), // 添加顶部边框
        bottom: BorderSide(
          color: TColor.greyColor1.withValues(alpha: 0.2),
          width: 1,
        ), // 显示底部边框
        right: BorderSide.none,
        left: BorderSide.none, // 隐藏左边框
      ),
    ),
    lineTouchData: LineTouchData(
      enabled: true,
      touchTooltipData: LineTouchTooltipData(
        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          return touchedBarSpots.map((barSpot) {
            final flSpot = barSpot;
            return LineTooltipItem(
              '${weekdays[flSpot.x.toInt() - 1]}: ${flSpot.y.toInt()}',
              const TextStyle(color: Colors.white),
            );
          }).toList();
        },
      ),
    ),
  );
}

class _HomeViewState extends State<HomeView> {
  List lastWorkoutArray = [
    {
      "name": "Fullbody Workout",
      "image": "assets/img/Vector.png",
      "kcal": "180 Calories Burn",
      "time": "20minutes",
      "progress": 0.3,
    },
    {
      "name": "Lowerbody Workout",
      "image": "assets/img/Workout-Pic.png",
      "kcal": "200 Calories Burn",
      "time": "30minutes",
      "progress": 0.4,
    },
    {
      "name": "Ab Workout",
      "image": "assets/img/Vector(1).png",
      "kcal": "400 Calories Burn",
      "time": "50minutes",
      "progress": 0.7,
    },
  ];
  List<int> showingTooltipOnSpots = [21];
  String? selectedValue = "Weekly";

  List<FlSpot> get allSpots => const [
    FlSpot(0, 20),
    FlSpot(1, 25),
    FlSpot(2, 40),
    FlSpot(3, 50),
    FlSpot(4, 35),
    FlSpot(5, 40),
    FlSpot(6, 30),
    FlSpot(7, 20),
    FlSpot(8, 25),
    FlSpot(9, 40),
    FlSpot(10, 50),
    FlSpot(11, 35),
    FlSpot(12, 50),
    FlSpot(13, 60),
    FlSpot(14, 40),
    FlSpot(15, 50),
    FlSpot(16, 20),
    FlSpot(17, 25),
    FlSpot(18, 40),
    FlSpot(19, 50),
    FlSpot(20, 35),
    FlSpot(21, 80),
    FlSpot(22, 30),
    FlSpot(23, 20),
    FlSpot(24, 25),
    FlSpot(25, 40),
    FlSpot(26, 50),
    FlSpot(27, 35),
    FlSpot(28, 50),
    FlSpot(29, 60),
    FlSpot(30, 40),
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              TColor.brandColor2.withValues(alpha: 0.4),
              TColor.brandColor1.withValues(alpha: 0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        dotData: FlDotData(show: false),
        gradient: LinearGradient(colors: TColor.brandColorG),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back,",
                          style: TextStyle(
                            color: TColor.greyColor1,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Stefani Wong",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationView(),
                          ),
                        );
                      },
                      icon: Image.asset(
                        "assets/img/Notification-Icon.png",
                        width: 25,
                        height: 25,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  height: media.width * 0.4,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: TColor.brandColorG),
                    borderRadius: BorderRadius.circular(media.width * 0.075),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/img/bg_dots.png",
                        height: media.width * 0.4,
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BMI (Body Mass Index)",
                                  style: TextStyle(
                                    color: TColor.whiteColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "You have a normal weight",
                                  style: TextStyle(
                                    color: TColor.whiteColor,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: media.width * 0.05),
                                SizedBox(
                                  height: 35,
                                  width: 120,
                                  child: RoundButton(
                                    title: "View More",
                                    onPressed: () {},
                                    fontSize: 12,
                                    type: RoundButtonType.bgSGradient,
                                  ),
                                ),
                              ],
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (
                                          FlTouchEvent event,
                                          pieTouchResponse,
                                        ) {},
                                  ),
                                  startDegreeOffset: 250,
                                  borderData: FlBorderData(show: false),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                  sections: showingSections(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                    color: TColor.brandColor1.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Target",
                        style: TextStyle(
                          color: TColor.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 28,
                        child: RoundButton(
                          title: "Check",
                          type: RoundButtonType.bgGradient,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ActivityTrackerView(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Activity Status",
                    style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  height: media.width * 0.4,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: TColor.brandColor1.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 25,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Heart Rate",
                              style: TextStyle(
                                color: TColor.blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  colors: TColor.brandColorG,
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(
                                  Rect.fromLTRB(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                );
                              },
                              child: Text(
                                "78 BPM",
                                style: TextStyle(
                                  color: TColor.whiteColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      LineChart(
                        LineChartData(
                          showingTooltipIndicators:
                              lineBarsData
                                  .map((barData) {
                                    return showingTooltipOnSpots.map((index) {
                                      return ShowingTooltipIndicators([
                                        LineBarSpot(
                                          barData,
                                          lineBarsData.indexOf(barData),
                                          barData.spots[index],
                                        ),
                                      ]);
                                    }).toList();
                                  })
                                  .expand((element) => element)
                                  .toList(),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (
                              FlTouchEvent event,
                              LineTouchResponse? response,
                            ) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return;
                              }
                              if (event is FlTapUpEvent) {
                                final spotIndex =
                                    response.lineBarSpots!.first.spotIndex;
                                showingTooltipOnSpots.clear();
                                setState(() {
                                  showingTooltipOnSpots.add(spotIndex);
                                });
                              }
                            },
                            mouseCursorResolver: (
                              FlTouchEvent event,
                              LineTouchResponse? response,
                            ) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                            getTouchedSpotIndicator: (
                              LineChartBarData barData,
                              List<int> spotIndexes,
                            ) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(color: Colors.red),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                              radius: 3,
                                              color: Colors.white,
                                              strokeWidth: 3,
                                              strokeColor:
                                                  TColor.secondaryColor1,
                                            ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipColor: (LineBarSpot spot) {
                                return TColor.secondaryColor1;
                              },

                              tooltipRoundedRadius: 20,
                              getTooltipItems: (
                                List<LineBarSpot> lineBarsSpot,
                              ) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    "${lineBarSpot.x.toInt()} mins ago",
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          lineBarsData: lineBarsData,
                          minY: 0,
                          maxY: 130,
                          titlesData: FlTitlesData(show: false),
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: media.width * 0.95,
                        decoration: BoxDecoration(
                          color: TColor.whiteColor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(color: TColor.blackColor, blurRadius: 2),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: SimpleAnimationProgressBar(
                                height: media.width * 0.85,
                                width: media.width * 0.07,
                                backgroundColor: Colors.grey.shade100,
                                foregrondColor: Colors.purple,
                                ratio: 0.5,
                                direction: Axis.vertical,
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(seconds: 3),
                                borderRadius: BorderRadius.circular(15),
                                gradientColor: LinearGradient(
                                  colors: TColor.brandColorG,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: media.width * 0.05),
                                  Text(
                                    "Water Intake",
                                    style: TextStyle(
                                      color: TColor.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: media.width * 0.02),
                                  ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) {
                                      return LinearGradient(
                                        colors: TColor.brandColorG,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(
                                        Rect.fromLTRB(
                                          0,
                                          0,
                                          bounds.width,
                                          bounds.height,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "4 Liters",
                                      style: TextStyle(
                                        color: TColor.whiteColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: media.width * 0.02),
                                  Text(
                                    "Real time updates",
                                    style: TextStyle(
                                      color: TColor.greyColor1,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: media.width * 0.02),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        waterArr.map((w0bj) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 4,
                                                      right: 8,
                                                    ),
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      color: TColor
                                                          .secondaryColor1
                                                          .withValues(
                                                            alpha: 0.5,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            5,
                                                          ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 4,
                                                      right: 8,
                                                    ),
                                                    width: 10,
                                                    height: 30,
                                                    child: DottedLine(
                                                      dashColor: TColor
                                                          .secondaryColor1
                                                          .withValues(
                                                            alpha: 0.5,
                                                          ),
                                                      dashGapLength: 4,
                                                      dashRadius: 5, // 减小半径
                                                      dashLength: 5,
                                                      direction:
                                                          Axis.vertical, // 水平方向，也可设为垂直Axis.vertical
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: media.width * 0.1,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    w0bj["title"].toString(),
                                                    style: TextStyle(
                                                      color: TColor.greyColor1,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback: (bounds) {
                                                      return LinearGradient(
                                                        colors:
                                                            TColor.brandColorG,
                                                        begin:
                                                            Alignment
                                                                .centerLeft,
                                                        end:
                                                            Alignment
                                                                .centerRight,
                                                      ).createShader(
                                                        Rect.fromLTRB(
                                                          0,
                                                          0,
                                                          bounds.width,
                                                          bounds.height,
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      w0bj["subtitle"]
                                                          .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            TColor.whiteColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: media.width * 0.45,
                            padding: EdgeInsets.symmetric(
                              vertical: 25,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: TColor.whiteColor,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: TColor.blackColor,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sleep",
                                  style: TextStyle(
                                    color: TColor.blackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                      colors: TColor.brandColorG,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ).createShader(
                                      Rect.fromLTRB(
                                        0,
                                        0,
                                        bounds.width,
                                        bounds.height,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "8h 20m",
                                    style: TextStyle(
                                      color: TColor.whiteColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Image.asset(
                                    "assets/img/Sleep-Graph.png",

                                    width: double.maxFinite,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: media.width * 0.05),
                          Container(
                            width: double.maxFinite,
                            height: media.width * 0.45,
                            padding: EdgeInsets.symmetric(
                              vertical: 25,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: TColor.whiteColor,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: TColor.blackColor,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Calories",
                                  style: TextStyle(
                                    color: TColor.blackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: media.width * 0.02),
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                      colors: TColor.brandColorG,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ).createShader(
                                      Rect.fromLTRB(
                                        0,
                                        0,
                                        bounds.width,
                                        bounds.height,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "760 kCal",
                                    style: TextStyle(
                                      color: TColor.whiteColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: media.width * 0.2,
                                    height: media.width * 0.2,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: media.width * 0.15,
                                          height: media.width * 0.15,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: TColor.brandColorG,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              media.width * 0.075,
                                            ),
                                          ),
                                          child: FittedBox(
                                            child: Text(
                                              "230kCal\nleft",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: TColor.whiteColor,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SimpleCircularProgressBar(
                                          progressStrokeWidth: 10,
                                          backStrokeWidth: 10,
                                          progressColors: TColor.brandColorG,
                                          backColor: Colors.grey.shade100,
                                          valueNotifier: ValueNotifier(50),
                                          startAngle: -180,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Workout Progress",
                      style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.brandColorG),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedValue,
                          items:
                              ["Weekly", "Monthly"]
                                  .map(
                                    (name) => DropdownMenuItem(
                                      value: name,
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                          color: TColor.greyColor1,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          icon: Icon(
                            Icons.expand_more,
                            color: TColor.whiteColor,
                          ),
                          hint: Text(
                            "Weekly",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: TColor.whiteColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: media.width * 0.5,
                  width: double.maxFinite,
                  child: SafeArea(
                    child:
                        selectedValue == "Weekly"
                            ? // 这里写 selectedValue 为 "Weekly" 时显示的 Widget
                            LineChart(
                              sampleData(),
                              duration: const Duration(milliseconds: 250),
                            )
                            : // 这里写 selectedValue 不为 "Weekly" 时显示的 Widget
                            const Text("你没有选择 Weekly。"),
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Workout",
                      style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See More",
                        style: TextStyle(
                          color: TColor.greyColor1,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: lastWorkoutArray.length,
                  itemBuilder: (context, index) {
                    var w0bj = lastWorkoutArray[index] as Map? ?? {};
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FinishedWorkoutView(),
                          ),
                        );
                      },
                      child: WorkoutRow(w0bj: w0bj),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
