import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modal/workouts.dart';

part 'workout_event.dart';
part 'workout_state.dart';

// class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
//
//   WorkoutBloc() : super(WorkoutInitial()) {
//     on<FetchWorkoutListEvent>((event, emit) {
//       emit(_fetchWorkoutList(event));
//     });
//
//     on<EditWorkoutListEvent>((event, emit) {});
//   }
//
//   Stream<MovieState> _fetchMovieList(FetchMovieListEvent event) async* {
//
// }
