import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/common_widget/round_textfield.dart';
import 'package:flutter_application_1/view/main_tab/main_tab_view.dart';

class WeclomeView extends StatefulWidget {
  const WeclomeView({super.key});

  @override
  State<WeclomeView> createState() => _WeclomeViewState();
}

class _WeclomeViewState extends State<WeclomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: media.width * 0.1),
              Image.asset(
                "assets/img/Group.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: media.width * 0.1),
              Text(
                "Welcome, Stefani",
                style: TextStyle(
                  color: TColor.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "You are all set now, let’s reach your\ngoals together with us",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.greyColor1, fontSize: 12),
              ),
              const Spacer(),

              RoundButton(
                title: "Go To Home",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainTabView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
