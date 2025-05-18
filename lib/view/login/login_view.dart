import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/common_widget/round_textfield.dart';
import 'package:flutter_application_1/view/login/signup_view.dart';
import 'package:flutter_application_1/view/login/weclome_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _WeclomeViewState();
}

class _WeclomeViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                "Hey there,",
                style: TextStyle(color: TColor.blackColor, fontSize: 16),
              ),
              Text(
                "Weclome back",
                style: TextStyle(
                  color: TColor.blackColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 15),
              Expanded(
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: TColor.greyColor1, 
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    ),
                ),
              ),
              SizedBox(height: 250),
              Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35),
                child: SizedBox(
                  height: 60,
                  child: RoundButton(
                    title: "Login",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WeclomeView(),
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
                  padding: const EdgeInsets.only(left: 55.0, right: 35),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupView(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Don’t have an account yet? ",
                          style: TextStyle(
                            color: TColor.blackColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Register ",
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
