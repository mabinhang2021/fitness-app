import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class WorkoutRow extends StatelessWidget {
  final Map w0bj;
  const WorkoutRow({super.key, required this.w0bj});

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
              w0bj["image"].toString(),
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
                  w0bj["name"].toString(),
                  style: TextStyle(color: TColor.blackColor, fontSize: 12),
                ),
                Text(
                  w0bj["kcal"].toString() + "|" + w0bj["time"].toString(),
                  style: TextStyle(color: TColor.greyColor1, fontSize: 10),
                ),
                SizedBox(height: 4),
                SimpleAnimationProgressBar(
                  height: 15,
                  width: media.width * 0.5,
                  backgroundColor: Colors.grey.shade100,
                  foregrondColor: Colors.purple,
                  ratio: w0bj["progress"] as double? ?? 0.0,
                  direction: Axis.horizontal,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 3),
                  borderRadius: BorderRadius.circular(7.5),
                  gradientColor: LinearGradient(
                    colors: TColor.brandColorG,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/img/Workout-Btn.png",
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
