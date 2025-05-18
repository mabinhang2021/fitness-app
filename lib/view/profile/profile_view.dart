import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/common_widget/setting_row.dart';
import 'package:flutter_application_1/common_widget/title_subtitle_cell.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool status = false;
  bool _isSwitched = true;
  List accountArr = [
    {
      "image": "assets/img/blueprofile.png",
      "name": "Personal Data",
      "tag": "1",
    },
    {"image": "assets/img/Document.png", "name": "Achievement", "tag": "2"},
    {"image": "assets/img/Graph.png", "name": "Activity History", "tag": "3"},
    {"image": "assets/img/Chart.png", "name": "Workout Progress", "tag": "4"},
  ];

  List otherArr = [
    {"image": "assets/img/Icon-Message.png", "name": "Contact Us", "tag": "5"},
    {
      "image": "assets/img/Icon-Privacy.png",
      "name": "Privacy Policy",
      "tag": "6",
    },
    {"image": "assets/img/Icon-Setting.png", "name": "Setting", "tag": "7"},
  ];
  List notificationArr = [
    {"image": "assets/img/ring.png", "name": "Pop-up Notification"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.whiteColor,
        elevation: 0,
        centerTitle: true,

        title: Text(
          "Profile",
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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/img/eatsnack.png",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stefani Wong",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Lose a Fat Program",
                          style: TextStyle(
                            color: TColor.greyColor1,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 25,
                    child: RoundButton(
                      title: "Edit",
                      type: RoundButtonType.bgGradient,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "180cm",
                      subtitle: "Height",
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TitleSubtitleCell(title: "65kg", subtitle: "Weight"),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TitleSubtitleCell(title: "22yo", subtitle: "Age"),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: TColor.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: accountArr.length,
                      itemBuilder: (context, index) {
                        var iObj = accountArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: iObj["name"].toString(),
                          onPressed: () {},
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Notification",
                    style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 10),
                  SizedBox(
                    height: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/ring.png",
                          height: 15,
                          width: 15,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            "Pop-up Notification",
                            style: TextStyle(
                              color: TColor.blackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //begin
                        
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // 1. 底部的渐变 Container (模拟轨道背景)
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              // Container 宽度可以略小于 Switch 总宽度，或者等于，根据视觉效果调整
                              width: 36 * 0.85, // 调整比例以匹配新尺寸
                              height: 18 * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.3),
                                gradient:
                                    _isSwitched // 假设 _isSwitched 在你的 State 中定义
                                        ? LinearGradient(
                                          colors: [
                                            TColor
                                                .secondaryColor1, // 确保 TColor 已定义
                                            TColor.secondaryColor2,
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        )
                                        : null,
                                color:
                                    !_isSwitched
                                        ? TColor.greyColor1.withOpacity(
                                          0.5,
                                        ) // 确保 TColor 已定义
                                        : null,
                              ),
                            ),
                            // 2. 顶层的 Switch 组件
                            SizedBox(
                              width: 36, // 使用要求的宽度
                              height: 18, // 使用要求的高度
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Switch(
                                  value:
                                      _isSwitched, // 假设 _isSwitched 在你的 State 中定义
                                  onChanged: (bool value) {
                                    // 这里需要调用你实际的 setState 来更新 _isSwitched
                                    setState(() {
                                      _isSwitched = value;
                                    });
                                    // 你也可以在这里调用你原来的 onToggle 逻辑
                                    print('Switch toggled to: $value');
                                    // 如果需要原来的 index (0 或 1)，可以转换:
                                    // int index = value ? 0 : 1; // 或者根据你的 'On'/'Off' 逻辑调整
                                    // print('switched to index: $index');
                                  },
                                  activeColor:
                                      TColor.whiteColor, // 确保 TColor 已定义
                                  inactiveThumbColor: TColor.whiteColor,
                                  activeTrackColor: Colors.transparent,
                                  inactiveTrackColor: Colors.transparent,
                                  trackOutlineColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                          return Colors.transparent;
                                        },
                                      ),
                                  trackOutlineWidth: MaterialStateProperty.all(
                                    0.0,
                                  ),
                                  // 可以根据需要调整 materialTapTargetSize 来优化点击区域
                                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //end
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: TColor.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Other",
                      style: TextStyle(
                        color: TColor.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: otherArr.length,
                      itemBuilder: (context, index) {
                        var iObj = otherArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: iObj["name"].toString(),
                          onPressed: () {},
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
