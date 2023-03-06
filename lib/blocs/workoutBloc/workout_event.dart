part of 'workout_bloc.dart';

@immutable
abstract class WorkoutEvent {
  const WorkoutEvent();
}

class FetchWorkoutListEvent extends WorkoutEvent {
  const FetchWorkoutListEvent();
}

class EditWorkoutListEvent extends WorkoutEvent {
  final WorkoutModel workout;
  // final int workoutIndex;
  final int? exIndex;

  EditWorkoutListEvent({required this.workout, this.exIndex});
}
