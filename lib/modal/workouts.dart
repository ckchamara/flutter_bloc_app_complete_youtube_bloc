import 'exercise.dart';

class WorkoutModel {
  String title;
  List<ExerciseModel> exercises;
  int index;
  int workoutDuration;

  WorkoutModel(
      {required this.title,
      required this.exercises,
      required this.index,
      required this.workoutDuration});

  factory WorkoutModel.fromJson(Map<String, dynamic> json, int workoutIndex) {
    int index = 0;
    List<ExerciseModel> exercises = <ExerciseModel>[];

    int startTime = 0;
    if (json['exercises'] != null) {
      json['exercises'].forEach((exercise) {
        exercises.add(ExerciseModel.fromJson(exercise, index, startTime));
        index++;
        startTime += exercises.last.prelude + exercises.last.duration;
      });
    }
    int workoutDuration = exercises.last.startTime;
    return WorkoutModel(
      title: json['title'],
      exercises: exercises,
      index: workoutIndex,
      workoutDuration: workoutDuration,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.exercises != null) {
      data['exercises'] = this.exercises.map((v) => v.toJson()).toList();
    }
    return data;
  }

  WorkoutModel copyWith(
          {String? title,
          List<ExerciseModel>? exercises,
          int? index,
          int? workoutDuration}) =>
      WorkoutModel(
        title: title ?? this.title,
        exercises: this.exercises,
        index: index ?? this.index,
        workoutDuration: this.workoutDuration,
      );
}
