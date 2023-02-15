part of 'workout_bloc.dart';

@immutable
abstract class WorkoutState {}

class WorkoutInitial extends WorkoutState {}
class WorkoutDataFetch extends WorkoutState {
  List<WorkoutModel>? workouts;
}
class WorkoutDataFetched extends WorkoutState {}
