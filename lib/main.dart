import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat/presentation/chat_provider.dart';
import 'package:flutter_application_1/view/login/complete_profile_view.dart';
import 'package:flutter_application_1/view/login/login_view.dart';
import 'package:flutter_application_1/view/login/signup_view.dart';
import 'package:flutter_application_1/view/login/weclome_view.dart';
import 'package:flutter_application_1/view/main_tab/main_tab_view.dart';
import 'package:flutter_application_1/view/on_boarding/on_boarding_view.dart';
import 'package:flutter_application_1/view/on_boarding/started_view.dart';
import 'package:flutter_application_1/pose_detection/posedetectioncore.dart';
import 'package:provider/provider.dart';
import 'common/colo_extension.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializePoseDetection();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness 3 in 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins", primaryColor: TColor.brandColor1),
      home: const MainTabView(),
    );
  }
}
