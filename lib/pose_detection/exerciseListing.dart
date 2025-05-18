import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pose_detection/Model/exerciseDataModel.dart';
import 'package:flutter_application_1/pose_detection/detectionScreen.dart';

class Exerciselisting extends StatefulWidget {
  const Exerciselisting({super.key});

  @override
  State<Exerciselisting> createState() => _ExerciselistingState();
}

class _ExerciselistingState extends State<Exerciselisting> {
  List<Exercisedatamodel> exerciseList = [];
  loadData() {
    exerciseList.add(
      Exercisedatamodel(
        "Push Ups",
        "pushup.gif",
        Color(0xff005F9C),
        ExerciseType.Pushups,
      ),
    );
    exerciseList.add(
      Exercisedatamodel(
        "Squats",
        "squat.gif",
        Color(0xffDF5089),
        ExerciseType.Squats,
      ),
    );
    exerciseList.add(
      Exercisedatamodel(
        "Plank to Downward Dog",
        "plank.gif",
        Color(0xffFD8636),
        ExerciseType.DownwardDogPlank,
      ),
    );
    exerciseList.add(
      Exercisedatamodel(
        "Jumping Jack",
        "jumping.gif",
        Color(0xff005F9C),
        ExerciseType.JumpingJack,
      ),
    );

    setState(() {
      exerciseList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pose Detection")),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Detectionscreen(
                          exercisedatamodel: exerciseList[index],
                        ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: exerciseList[index].color,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        exerciseList[index].title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "assets/img/${exerciseList[index].image}",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: exerciseList.length,
        ),
      ),
    );
  }
}
