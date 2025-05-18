import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/common_widget/round_textfield.dart';
import 'package:flutter_application_1/view/login/what_your_goal_view.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  TextEditingController txtDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/Vector-Section.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 30),
                Text(
                  "Let’s complete your profile",
                  style: TextStyle(
                    color: TColor.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "It will help us to know more about you!",
                  style: TextStyle(color: TColor.blackColor, fontSize: 12),
                ),
                const SizedBox(height: 30),

                // const RoundTextfield(
                //   hitText: "Choose Gender",
                //   icon: "assets/img/2 User.png",
                //   margin: const EdgeInsets.symmetric(horizontal: 30),
                //   controller: null,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: TColor.borderColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Image.asset(
                            "assets/img/USER.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: TColor.greyColor1,
                          ),
                        ),
                        
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items:
                                  ["Male", "Female"]
                                      .map(
                                        (name) => DropdownMenuItem(
                                          value: name,
                                          child: Text(
                                            name,
                                            style: TextStyle(
                                              color: TColor.greyColor1,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {},
                              isExpanded: true,
                              hint: Text(
                                "Choose Gender",
                                style: TextStyle(
                                  color: TColor.greyColor1,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),

                ///first line
                const SizedBox(height: 15),
                RoundTextfield(
                  hitText: "Date of Birth",
                  icon: "assets/img/Calendar.png",
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  controller: txtDate,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: const RoundTextfield(
                        hitText: "Your Weight",
                        icon: "assets/img/weight-scale 1.png",
                        margin: const EdgeInsets.only(left: 30),
                        controller: null,
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: TColor.secondaryColorG,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "KG",
                        style: TextStyle(
                          color: TColor.whiteColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: const RoundTextfield(
                        hitText: "Your Height",
                        icon: "assets/img/Swap.png",
                        margin: const EdgeInsets.only(left: 30),
                        controller: null,
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: TColor.secondaryColorG,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "CM",
                        style: TextStyle(
                          color: TColor.whiteColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                RoundButton(
                  title: "Next >",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WhatYourGoalView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
