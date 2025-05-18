import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class UpcomingWorkoutRow extends StatefulWidget {
  final Map w0bj;

  const UpcomingWorkoutRow({super.key, required this.w0bj});

  @override
  State<UpcomingWorkoutRow> createState() => _UpcomingWorkoutRowState();
}

class _UpcomingWorkoutRowState extends State<UpcomingWorkoutRow> {
  bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: TColor.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              widget.w0bj["image"].toString(),
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
                  widget.w0bj["name"].toString(),
                  style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.w0bj["day"].toString() +
                      "," +
                      widget.w0bj["time"].toString(),
                  style: TextStyle(color: TColor.greyColor1, fontSize: 10),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
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
                              TColor.secondaryColor1, // 确保 TColor 已定义
                              TColor.secondaryColor2,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )
                          : null,
                  color:
                      !_isSwitched
                          ? TColor.greyColor1.withOpacity(0.5) // 确保 TColor 已定义
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
                    value: _isSwitched, // 假设 _isSwitched 在你的 State 中定义
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
                    activeColor: TColor.whiteColor, // 确保 TColor 已定义
                    inactiveThumbColor: TColor.whiteColor,
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                    trackOutlineColor:
                        MaterialStateProperty.resolveWith<Color?>((
                          Set<MaterialState> states,
                        ) {
                          return Colors.transparent;
                        }),
                    trackOutlineWidth: MaterialStateProperty.all(0.0),
                    // 可以根据需要调整 materialTapTargetSize 来优化点击区域
                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
