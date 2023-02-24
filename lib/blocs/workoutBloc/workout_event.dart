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

  EditWorkoutListEvent(this.exercises);
}
