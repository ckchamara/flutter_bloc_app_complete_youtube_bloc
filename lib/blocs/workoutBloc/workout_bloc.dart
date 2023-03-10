import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modal/exercise.dart';
import '../../modal/workouts.dart';

part 'workout_event.dart';

part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutInitialState()) {
    on<FetchWorkoutListEvent>(_fetchWorkoutList);
    on<EditWorkoutListEvent>(_editWorkoutList);
    on<SaveEditedExerciseEvent>(_editExercise);
  }

  _fetchWorkoutList(
      FetchWorkoutListEvent event, Emitter<WorkoutState> emit) async {
    //async* makes function not runnable

    try {
      final jsonData = await rootBundle.loadString('assets/workouts.json');
      // Map<String, dynamic> workoutJson = jsonDecode(jsonData);
      final workoutJson = jsonDecode(jsonData);
      int index = 0;
      List<WorkoutModel> workouts = [];

      workoutJson.forEach((element) {
        WorkoutModel workout = WorkoutModel.fromJson(element, index);
        workouts.add(workout);
        index++;
      });

      if (workouts.isNotEmpty) {
        emit(WorkoutDataFetchState(workouts));
      } else {
        emit(FailToLoadWorkoutListState());
      }
    } catch (e) {
      emit(FailToLoadWorkoutListState());
      print("$e");
    }


    // Usage
    final myBloc = WorkoutBloc();
    final currentState = myBloc.state;
    final myStateVariable = (currentState as WorkoutDataFetchState).workouts;
  }

  _editWorkoutList(EditWorkoutListEvent event, Emitter<WorkoutState> emit) {
    try {
      print(event.exIndex);
      emit(EditWorkoutListState(
          workout: event.workout,
          exIndex: event.exIndex));
    } catch (e) {
      print("$e");
    }
  }

  _editExercise(SaveEditedExerciseEvent event, Emitter<WorkoutState> emit) {

    WorkoutDataFetchState statke = state as WorkoutDataFetchState;
    statke.workouts![event.workout.index]?.copyWith(
      exercises: event.workout.exercises
    );
  }
}
