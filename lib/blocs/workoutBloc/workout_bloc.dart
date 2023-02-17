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
    // on<EditWorkoutListEvent>(null);
  }

  _fetchWorkoutList(FetchWorkoutListEvent event, Emitter<WorkoutState> emit) async* {
    try{
      final jsonData = await rootBundle.loadString('assets/workout.json');
      var workoutJson = jsonDecode(jsonData);
      int index = 0;
       List<WorkoutModel> workouts = workoutJson.map((wrkout) {
        WorkoutModel workout = WorkoutModel.fromJson(wrkout, index);
        index++;
        return workout;
      }).toList();
      if(workouts.isNotEmpty){
        emit(WorkoutDataFetchState(workouts));
      }else {
        emit(FailToLoadWorkoutListState());
      }
    }catch (_){
        emit(FailToLoadWorkoutListState());
    }
  }
}
