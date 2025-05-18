import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/notification_row.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List notificationArray = [
    {
      "image": "assets/img/Ellipse.png",
      "title": "Hey, it’s time for lunch",
      "time": "About 1 minutes ago",
    },
    {
      "image": "assets/img/pinkrun.png",
      "title": "Don’t miss your lowerbody workout",
      "time": "About 3 hours ago",
    },
    {
      "image": "assets/img/bluecake.png",
      "title": "Hey, let’s add some meals for your b",
      "time": "About 3 hours ago",
    },
    {
      "image": "assets/img/bluelay.png",
      "title": "Congratulations, You have finished A..",
      "time": "29 May",
    },
    {
      "image": "assets/img/empty.png",
      "title": "Hey, it’s time for lunch",
      "time": "8 April",
    },
    {
      "image": "assets/img/pinkrun.png",
      "title": "Ups, You have missed your Lowerbo...",
      "time": "8 April",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: TColor.borderColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/back.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Notification",
          style: TextStyle(
            color: TColor.blackColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: TColor.borderColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/img/dot.png",
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: TColor.whiteColor,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var n0bj = notificationArray[index] as Map? ?? {};
          return NotificationRow(n0bj: n0bj);
        }),
        separatorBuilder: (context, index) {
          return Divider(
            color: TColor.greyColor1.withValues(alpha: 0.4),
            height: 1,
          );
        },
        itemCount: notificationArray.length,
      ),
    );
  }
}
