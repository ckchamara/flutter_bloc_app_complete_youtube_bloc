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
  final int? exIndex;

  EditWorkoutListEvent({required this.workout, this.exIndex});
}

class SaveEditedExerciseEvent extends WorkoutEvent {
  final WorkoutModel workout;

  SaveEditedExerciseEvent(this.workout);
}

class WorkoutInProgressEvent extends WorkoutEvent {
  final WorkoutModel workout;

  WorkoutInProgressEvent({required this.workout});
}


