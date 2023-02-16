import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modal/workouts.dart';

part 'workout_event.dart';

part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutInitial()) {
    on<FetchWorkoutListEvent>(_fetchWorkoutList);

  }

  Stream<void> _fetchWorkoutList(FetchWorkoutListEvent event, Emitter<WorkoutState> emit) async* {
    String jsonData = await rootBundle.loadString('assets/workout.json');
    var workoutJson = jsonDecode(jsonData);
    List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(workoutJson);

    WorkoutModel workoutd;
    // emit(WorkoutDataFetch());
  }

    _fetchWorkoutListe() async* {
    String jsonData = await rootBundle.loadString('assets/workout.json');
    var workoutJson = jsonDecode(jsonData);
    WorkoutModel.fromJson(workoutJson);
  }


}
