import 'package:flutter/material.dart';

import '../common/colo_extension.dart';

class TitleSubtitleCell extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleSubtitleCell({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 95,
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: TColor.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Column(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: TColor.brandColorG,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
            },
            child: Text(
              title,
              style: TextStyle(
                color: TColor.whiteColor.withValues(alpha: 0.7),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(color: TColor.greyColor1, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
