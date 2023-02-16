part of 'workout_bloc.dart';

@immutable
abstract class WorkoutState extends Equatable {}

class WorkoutInitialState extends WorkoutState {
  @override
  List<Object?> get props => [];
}

class WorkoutDataFetchState extends WorkoutState {
  final List<WorkoutModel>? workouts;

  WorkoutDataFetchState(this.workouts);

  @override
  List<Object?> get props => [workouts];
}

class WorkoutDataFetchedState extends WorkoutState {
  @override
  List<Object?> get props => [];
}

class FailToLoadWorkoutListState extends WorkoutState {
  @override
  List<Object?> get props => [];
}

class EditWorkoutListState extends WorkoutState {
  final List<ExerciseModel> exercises;
  final String title;
  final int? exIndex;

  EditWorkoutListState(this.exercises, this.title, {this.exIndex});

  @override
  List<Object?> get props => [exercises, title, exIndex];
}

// class EditExerciseListState extends WorkoutState {
//   final List<ExerciseModel> exercises;
//   final String title;
//
//   EditExerciseListState(this.exercises, this.title);
//
//   @override
//   List<Object?> get props => [exercises];
// }

