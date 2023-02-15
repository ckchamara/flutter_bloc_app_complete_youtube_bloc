import 'exercise.dart';

class WorkoutModel {
  String? title;
  List<ExerciseModel>? exercises;
  int? index;

  WorkoutModel({this.title, this.exercises});

  WorkoutModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['exercises'] != null) {
      exercises = <ExerciseModel>[];
      json['exercises'].forEach((v) {
        exercises!.add(new ExerciseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.exercises != null) {
      data['exercises'] = this.exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}