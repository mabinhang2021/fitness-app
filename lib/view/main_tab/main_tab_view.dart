import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/tab_button.dart';
import 'package:flutter_application_1/digital_human/model_selection_page.dart';
import 'package:flutter_application_1/pose_detection/posedetectioncore.dart';
import 'package:flutter_application_1/view/home/home_view.dart';
import 'package:flutter_application_1/view/profile/profile_view.dart';
import 'package:flutter_application_1/view/workout_tracker/workout_tracker_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ModelSelectionPage()),
            );
          },
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.brandColorG),
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 2),
              ],
            ),
            child: Icon(Icons.search, color: TColor.whiteColor, size: 35),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: TColor.whiteColor,
            boxShadow: [
              BoxShadow(
                color: TColor.blackColor,
                blurRadius: 2,
                offset: Offset(0, -2),
              ),
            ],
          ),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                icon: "assets/img/home_tab.png",
                selectIcon: "assets/img/home_tab_select.png",
                isActive: selectTab == 0,
                onTap: () {
                  selectTab = 0;
                  currentTab = const HomeView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
              TabButton(
                icon: "assets/img/Activity.png",
                selectIcon: "assets/img/activity_tab_select.png",
                isActive: selectTab == 1,
                onTap: () {
                  selectTab = 1;
                  currentTab = const WorkoutTrackerView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
              SizedBox(width: 40),
              TabButton(
                icon: "assets/img/Camera.png",
                selectIcon: "assets/img/camera_tab_select.png",
                isActive: selectTab == 2,
                onTap: () {
                  selectTab = 2;
                  currentTab = PoseDetectionApp();
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
              TabButton(
                icon: "assets/img/Profile.png",
                selectIcon: "assets/img/profile_tab_select.png",
                isActive: selectTab == 3,
                onTap: () {
                  selectTab = 3;
                  currentTab = const ProfileView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
