import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';

class NotificationRow extends StatelessWidget {
  final Map n0bj;
  const NotificationRow({super.key, required this.n0bj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              n0bj["image"].toString(),
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  n0bj["title"].toString(),
                  style: TextStyle(
                    color: TColor.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Text(
                  n0bj["time"].toString(),
                  style: TextStyle(color: TColor.greyColor1, fontSize: 10),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/img/Icon-More.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
