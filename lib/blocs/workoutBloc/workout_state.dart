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


class FailToLoadWorkoutListState extends WorkoutState {
  @override
  List<Object?> get props => [];
}

class EditWorkoutListState extends WorkoutState {
  final WorkoutModel workout;
  final int? exIndex;

  EditWorkoutListState({required this.workout, this.exIndex});

  @override
  List<Object?> get props => [workout, exIndex];
}


