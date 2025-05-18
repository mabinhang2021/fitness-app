import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';

class OnBoardingPage extends StatelessWidget {
  final Map p0bj;
  const OnBoardingPage({super.key,required this.p0bj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //picture first
          Image.asset(
            p0bj["image"].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: 64),

          //middle text
          Padding(
            padding: const EdgeInsets.fromLTRB(29, 0, 15, 0),
            child: Text(
              p0bj["title"].toString(),
              style: TextStyle(
                color: TColor.blackColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //last text
          Padding(
            padding: const EdgeInsets.fromLTRB(29, 25, 15, 0),
            child: Text(
              p0bj["subtitle"].toString(),
              style: TextStyle(
                fontSize: 14,
                color: TColor.greyColor1,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
