import 'exercise.dart';

class WorkoutModel {
  String? title;
  List<ExerciseModel>? exercises;
  int? index;

  WorkoutModel({this.title, this.exercises, this.index});

  factory WorkoutModel.fromJson(Map<String, dynamic> json, int workoutIndex) {
    int index = 0;
    List<ExerciseModel> exercises = <ExerciseModel>[];
    if (json['exercises'] != null) {
      json['exercises'].forEach((exercise) {
        exercises!.add(new ExerciseModel.fromJson(exercise,index));
        index++;
      });
    }

    return WorkoutModel(title: json['title'], exercises: exercises,index: workoutIndex);
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