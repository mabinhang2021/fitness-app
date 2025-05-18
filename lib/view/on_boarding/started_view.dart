import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/view/on_boarding/on_boarding_view.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [TColor.brandColor2, TColor.brandColor1],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Fitness",
              style: TextStyle(
                color: TColor.blackColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Everybody Can Train",
              style: TextStyle(
                color: TColor.greyColor1,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnBoardingView(),
                        ),
                      );
                    });
                  },
                  title: "Get Started",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
