import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';

class ActivityRow extends StatelessWidget {
  final Map w0bj;
  const ActivityRow({super.key, required this.w0bj});

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
                  w0bj["title"].toString(),
                  style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  w0bj["time"].toString(),
                  style: TextStyle(color: TColor.greyColor1, fontSize: 10),
                ),
                SizedBox(height: 4),
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
