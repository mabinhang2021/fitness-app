import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/on_boarding_page.dart';
import 'package:flutter_application_1/view/login/signup_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();
  void initSate() {
    super.initState();
    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Track Your Goal",
      "subtitle":
          "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      "image": "assets/img/on_1.png",
    },
    {
      "title": "Get Burn",
      "subtitle":
          "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "image": "assets/img/on_2.png",
    },
    {
      "title": "Eat Well",
      "subtitle":
          "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      "image": "assets/img/on_3.png",
    },
    {
      "title": "Improve Sleep  Quality",
      "subtitle":
          "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
      "image": "assets/img/on_4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var p0bj = pageArr[index] as Map? ?? {};
              return OnBoardingPage(p0bj: p0bj);
            },
          ),
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                //show 1/4 2/4/ 3/4
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TColor.brandColor1,
                    value: (selectPage + 1) / 4,
                    strokeWidth: 2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  decoration: BoxDecoration(
                    color: TColor.brandColor1,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  width: 60,
                  height: 60,
                  child: IconButton(
                    onPressed: () {
                      if (selectPage < 3) {
                        selectPage = selectPage + 1;
                        controller.jumpToPage(selectPage);

                        setState(() {});
                      } else {
                        //open welcome sreen
                        print("open weclome screen");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupView(),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.navigate_next, color: TColor.whiteColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
