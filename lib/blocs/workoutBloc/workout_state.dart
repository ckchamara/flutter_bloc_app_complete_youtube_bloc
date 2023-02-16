part of 'workout_bloc.dart';

@immutable
abstract class WorkoutState extends Equatable {}

class WorkoutInitial extends WorkoutState {
  @override
  List<Object?> get props => [];
}
class WorkoutDataFetch extends WorkoutState {
  List<WorkoutModel>? workouts;

  WorkoutDataFetch(this.workouts);

  @override
  List<Object?> get props => [workouts];
}
class WorkoutDataFetched extends WorkoutState {
  @override
  List<Object?> get props => [];
}
