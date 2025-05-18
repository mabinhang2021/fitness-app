import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';

class TodayTargetCell extends StatelessWidget {
  final String icon;
  final String value;
  final String title;
  const TodayTargetCell({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: TColor.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 40),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: TColor.brandColorG,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(
                      Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                    );
                  },
                  child: Text(
                    value,
                    style: TextStyle(color: TColor.whiteColor, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(color: TColor.blackColor, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
