import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/common_widget/upcoming_workout_row.dart';
import 'package:flutter_application_1/common_widget/what_train_row.dart';
import 'package:flutter_application_1/view/home/activity_tracker_view.dart';
import 'package:flutter_application_1/view/home/home_view.dart';

class WorkoutTrackerView extends StatefulWidget {
  const WorkoutTrackerView({super.key});

  @override
  State<WorkoutTrackerView> createState() => _WorkoutTrackerViewState();
}

class _WorkoutTrackerViewState extends State<WorkoutTrackerView> {
  List upcomingArray = [
    {
      "image": "assets/img/upcoming1.png",
      "name": "Fullbody Workout",
      "day": "Today",
      "time": "03:00pm",
    },
    {
      "image": "assets/img/upcoming2.png",
      "name": "Upperbody Workout",
      "day": "June 05",
      "time": "02:00pm",
    },
  ];
  List trainArray = [
    {
      "image": "assets/img/train1.png",
      "name": "Fullbody Workout",
      "exercise_time": "11 Exercises",
      "time": "32mins",
    },
    {
      "image": "assets/img/train2.png",
      "name": "Lowerbody Workout",
      "exercise_time": "12 Exercises",
      "time": "40mins",
    },
    {
      "image": "assets/img/train3.png",
      "name": "AB Workout",
      "exercise_time": "14 Exercises",
      "time": "20mins",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(), // 更流畅的滚动效果
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // 第一个SliverAppBar - 标题和操作按钮
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              pinned: true,
              floating: false,
              snap: false,
              leadingWidth: 0,
              expandedHeight: media.width * 0.1, // 减小高度
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: TColor.brandColorG),
                ),
              ),
              title: Text(
                "Workout Tracker",
                style: TextStyle(
                  color: TColor.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: TColor.borderColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/img/dot.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),

            // 第二个SliverAppBar - 图表区域
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              // 固定在顶部
              expandedHeight: media.width * 0.5,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: TColor.brandColorG),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LineChart(sampleData()),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: TColor.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: TColor.greyColor1.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(height: 15),
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
                          "Daily Workout Schedule",
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
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming Workout",
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
                  //begin
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: upcomingArray.length,
                    itemBuilder: (context, index) {
                      var w0bj = upcomingArray[index] as Map? ?? {};
                      return InkWell(
                        onTap: () {},
                        child: UpcomingWorkoutRow(w0bj: w0bj),
                      );
                    },
                  ),
                  //end
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "What Do You Want to Train",
                        style: TextStyle(
                          color: TColor.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: trainArray.length,
                    itemBuilder: (context, index) {
                      var w0bj = trainArray[index] as Map? ?? {};
                      return InkWell(
                        onTap: () {},
                        child: WhatTrainRow(w0bj: w0bj),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
