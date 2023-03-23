import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
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
    on<WorkoutInProgressEvent>(_workoutInProgress);

  }

  List<WorkoutModel> workouts = [];

  _fetchWorkoutList(FetchWorkoutListEvent event,
      Emitter<WorkoutState> emit) async {
    //async* makes function not runnable

    try {
      if (workouts.isEmpty) {
        print('inside _fetchworkoutstate');
        final jsonData = await rootBundle.loadString('assets/workouts.json');
        // Map<String, dynamic> workoutJson = jsonDecode(jsonData);
        final workoutJson = jsonDecode(jsonData);
        int index = 0;

        workoutJson.forEach((element) {
          WorkoutModel workout = WorkoutModel.fromJson(element, index);
          workouts.add(workout);
          index++;
        });
      }

      if (workouts.isNotEmpty) {
        emit(WorkoutDataFetchState(workouts));
      } else {
        emit(FailToLoadWorkoutListState());
      }
    } catch (e) {
      emit(FailToLoadWorkoutListState());
      print("$e error workout_bloc.dart");
    }

    // Usage
    final myBloc = WorkoutBloc();
    final currentState = myBloc.state;
    print("State is $currentState workout_bloc.dart");
    // final myStateVariable = (currentState as WorkoutDataFetchState).workouts;
  }

  _editWorkoutList(EditWorkoutListEvent event, Emitter<WorkoutState> emit) {
    try {
      emit(
          EditWorkoutListState(workout: event.workout, exIndex: event.exIndex));
    } catch (e) {
      print("$e error");
    }
  }

  _editExercise(SaveEditedExerciseEvent event, Emitter<WorkoutState> emit) {
    workouts[event.workout.index] =
        WorkoutModel.fromJson(event.workout.toJson(), event.workout.index);
  }



  _workoutInProgress(WorkoutInProgressEvent event, Emitter<WorkoutState> emit) async {

    int workoutRemainingTime = event.workout.getTotalWorkoutTime();
    final Stream myStream = Stream.periodic(Duration(seconds: 1), (count) => workoutRemainingTime - count);

    await emit.forEach(myStream, onData: (data) {
      emit(WorkoutInProgressState(event.workout, data));
        return WorkoutInProgressState(event.workout, data);
    });

  }
}
