import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/view/login/login_view.dart';
import 'package:flutter_application_1/view/login/weclome_view.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  List goalArray = [
    {
      "image": "assets/img/barbell.png",
      "title": "Improve Shape",
      "subtitle":
          "I have a low amount of body fat\n and need / want to build more\n muscle",
    },
    {
      "image": "assets/img/jumpro.png",
      "title": "Lean & Tone",
      "subtitle":
          "I’m “skinny fat”. look thin but have\n no shape. I want to add learn\n muscle in the right way",
    },
    {
      "image": "assets/img/running.png",
      "title": "Lose a Fat",
      "subtitle":
          "I have over 20 lbs to lose. I want to\n drop all this fat and gain muscle\n mass",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: CarouselSlider(
                items:
                    goalArray
                        .map(
                          (imagePath) => Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.brandColorG,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: media.width * 0.1,
                              horizontal: 25,
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Image.asset(
                                  imagePath["image"].toString(),
                                  width: media.width * 0.6,
                                  fit: BoxFit.fitWidth,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  imagePath["title"].toString(),
                                  style: TextStyle(
                                    color: TColor.whiteColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(width: media.width *0.2,height: 1,color: TColor.whiteColor,),
                                Text(
                                  imagePath["subtitle"].toString(),
                                  style: TextStyle(
                                    color: TColor.whiteColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 0.74,
                  initialPage: 0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "What is your goal ?",
                    style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "It will help us to choose a best\n program for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.blackColor, fontSize: 12),
                  ),
                  const Spacer(),
                  RoundButton(
                    title: "Confirm",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
