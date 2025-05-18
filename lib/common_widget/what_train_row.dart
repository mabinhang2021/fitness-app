import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';

import '../common/colo_extension.dart';

class WhatTrainRow extends StatelessWidget {
  final Map w0bj;
  const WhatTrainRow({super.key, required this.w0bj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              TColor.brandColor2.withValues(alpha: 0.3),
              TColor.brandColor1.withValues(alpha: 0.3),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    w0bj["name"].toString(),
                    style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${w0bj["exercise_time"].toString()} | ${w0bj["time"].toString()}",
                    style: TextStyle(color: TColor.greyColor1, fontSize: 12),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: RoundButton(
                      title: "View More",
                      fontSize: 10,
                      type: RoundButtonType.textGradient,
                      elevation: 0.05,
                      fontWeight: FontWeight.w400,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.54),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    w0bj["image"].toString(),
                    width: 90,
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
