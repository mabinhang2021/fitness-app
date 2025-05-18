import 'dart:ui';

enum ExerciseType { Pushups, Squats, DownwardDogPlank, JumpingJack, HighKnees }

class Exercisedatamodel {
  String title;
  String image;
  Color color;
  ExerciseType type;
  Exercisedatamodel(this.title, this.image, this.color, this.type);
}
