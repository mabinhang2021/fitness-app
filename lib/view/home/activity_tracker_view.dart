import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/activity_row.dart';
import 'package:flutter_application_1/common_widget/bar_chart_function.dart';
import 'package:flutter_application_1/common_widget/today_target_cell.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class ActivityTrackerView extends StatefulWidget {
  const ActivityTrackerView({super.key});

  @override
  State<ActivityTrackerView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<ActivityTrackerView> {
  String? selectedValue = "Weekly";
  List latestActivityArray = [
    {
      "title": "Drinking 300ml Water",
      "image": "assets/img/Latest-Pic.png",
      "time": "About 3 minutes ago",
    },
    {
      "title": "Eat Snack(Fitbar)",
      "image": "assets/img/eatsnack.png",
      "time": "About 10 minutes ago",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
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
              "assets/img/back.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Activity Tracker",
          style: TextStyle(
            color: TColor.blackColor,
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
      backgroundColor: TColor.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      TColor.brandColor2.withValues(alpha: 0.3),
                      TColor.brandColor1.withValues(alpha: 0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today Target",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.brandColorG,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              height: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              textColor: TColor.brandColor1,
                              minWidth: double.maxFinite,
                              elevation: 0,
                              color: Colors.transparent,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Expanded(
                          child: TodayTargetCell(
                            icon: "assets/img/Layer2.png",
                            title: "Water Intake",
                            value: "8L",
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TodayTargetCell(
                            icon: "assets/img/shoes.png",
                            title: "Foot Steps",
                            value: "2400",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activity Progress",
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
                        icon: Icon(Icons.expand_more, color: TColor.whiteColor),
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
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 15),
                height: media.width * 0.5,
                width: double.maxFinite,
                child: SafeArea(
                  child:
                      selectedValue == "Weekly"
                          ? // 这里写 selectedValue 为 "Weekly" 时显示的 Widget
                          MyBarChart()
                          : // 这里写 selectedValue 不为 "Weekly" 时显示的 Widget
                          const Text("你没有选择 Weekly。"),
                ),
              ),
              //text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Activity",
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
              const SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: latestActivityArray.length,
                itemBuilder: (context, index) {
                  var w0bj = latestActivityArray[index] as Map? ?? {};
                  return InkWell(onTap: () {}, child: ActivityRow(w0bj: w0bj));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
