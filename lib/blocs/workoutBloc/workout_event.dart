part of 'workout_bloc.dart';

@immutable
abstract class WorkoutEvent {
  const WorkoutEvent();
}

class FetchWorkoutListEvent extends WorkoutEvent {
  const FetchWorkoutListEvent();
}

class EditWorkoutListEvent extends WorkoutEvent {
  List<ExerciseModel> exercises;
  String title;
  int? exIndex;

  EditWorkoutListEvent(this.exercises, this.title, {this.exIndex});
}

// class EditExerciseListEvent extends WorkoutEvent {
//   List<ExerciseModel> exercises;
//   String title;
//
//   EditExerciseListEvent(this.exercises, this.title);
// }


