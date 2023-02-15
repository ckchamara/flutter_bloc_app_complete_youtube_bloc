part of 'workout_bloc.dart';

@immutable
abstract class WorkoutEvent {}

class FetchWorkoutListEvent extends WorkoutEvent {}
class EditWorkoutListEvent extends WorkoutEvent {}
