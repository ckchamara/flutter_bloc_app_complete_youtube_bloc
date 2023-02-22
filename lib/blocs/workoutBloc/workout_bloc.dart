import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modal/workouts.dart';

part 'workout_event.dart';

part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutInitialState()) {
    on<FetchWorkoutListEvent>(_fetchWorkoutList);
    // on<EditWorkoutListEvent>(null);
  }

  _fetchWorkoutList(
      FetchWorkoutListEvent event, Emitter<WorkoutState> emit) async {  //async* makes function not runnable
    print("works");
    try {
      final jsonData = await rootBundle.loadString('assets/workouts.json');
      // Map<String, dynamic> workoutJson = jsonDecode(jsonData);
      final workoutJson = jsonDecode(jsonData);
      workoutJson.forEach((element) {   print(element); print("       ");});
      int index = 0;
      List<WorkoutModel> workouts = workoutJson.map((wrkout) {
        print(wrkout);
        WorkoutModel workout = WorkoutModel.fromJson(wrkout, index);
        index++;
        return workout;
      }).toList();
      if (workouts.isNotEmpty) {
        emit(WorkoutDataFetchState(workouts));
      } else {
        emit(FailToLoadWorkoutListState());
      }
    } catch (_) {
      emit(FailToLoadWorkoutListState());
    }
  }



}
