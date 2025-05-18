import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/common_widget/round_textfield.dart';
import 'package:flutter_application_1/view/login/complete_profile_view.dart';
import 'package:flutter_application_1/view/login/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                "Hey there,",
                style: TextStyle(color: TColor.blackColor, fontSize: 16),
              ),
              Text(
                "Create an Account",
                style: TextStyle(
                  color: TColor.blackColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              const RoundTextfield(
                hitText: "First Name",
                icon: "assets/img/Profile.png",
                margin: const EdgeInsets.symmetric(horizontal: 30),
                controller: null,
              ),
              const SizedBox(height: 15),
              const RoundTextfield(
                hitText: "Last Name",
                icon: "assets/img/Profile.png",
                margin: const EdgeInsets.symmetric(horizontal: 30),
                controller: null,
              ),
              const SizedBox(height: 15),
              const RoundTextfield(
                hitText: "Email",
                icon: "assets/img/Message.png",
                margin: const EdgeInsets.symmetric(horizontal: 30),
                controller: null,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              RoundTextfield(
                hitText: "Password",
                icon: "assets/img/Lock.png",
                margin: const EdgeInsets.symmetric(horizontal: 30),
                controller: null,
                keyboardType: TextInputType.visiblePassword,
                isPasswordField: true,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: TColor.greyColor1,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "By continuing you accept our Privacy Policy and\n Term of Use",
                        style: TextStyle(
                          color: TColor.greyColor1,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 147),
              Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35),
                child: SizedBox(
                  height: 60,
                  child: RoundButton(
                    title: "Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CompleteProfileView(),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 29),
              Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        height: 1,
                        color: TColor.greyColor1.withValues(alpha: 0.5),
                      ),
                    ),
                    Text(
                      "  Or  ",
                      style: TextStyle(color: TColor.blackColor, fontSize: 12),
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        height: 1,
                        color: TColor.greyColor1.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColor.whiteColor,
                        border: Border.all(
                          width: 1,
                          color: TColor.greyColor1.withValues(alpha: 0.4),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset("assets/img/google.png"),
                    ),
                  ),
                  SizedBox(width: media.width * 0.04),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColor.whiteColor,
                        border: Border.all(
                          width: 1,
                          color: TColor.greyColor1.withValues(alpha: 0.4),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset("assets/img/facebook.png"),
                    ),
                  ),
                ],
              ),
              //button
              const SizedBox(height: 30),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 75.0, right: 75),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Login ",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
