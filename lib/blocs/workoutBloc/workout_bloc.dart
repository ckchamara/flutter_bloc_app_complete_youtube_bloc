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

  _fetchWorkoutList(
      FetchWorkoutListEvent event, Emitter<WorkoutState> emit) async {
    //async* makes function not runnable

    try {
      if (workouts.isEmpty) {
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
    // final myBloc = WorkoutBloc();
    // final currentState = myBloc.state;
    // print("State is $currentState workout_bloc.dart");
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


  int timeElapsed = 0;

  _workoutInProgress(WorkoutInProgressEvent event, Emitter<WorkoutState> emit) async {
    int workoutRemainingTime = event.workout.getTotalWorkoutTime();
    final Stream myStream = Stream.periodic(Duration(seconds: 1), (count) {
      while (count <= workoutRemainingTime) {
        return count;
      }
    });

   // await myStream.listen((eventi) {emit(WorkoutInProgressState(event.workout, eventi));});

    // await emit.forEach(myStream, onData: (second) {
    //   emit(WorkoutInProgressState(event.workout, second));
    //   // print(second);
    //   return WorkoutInProgressState(event.workout, second);
    // });


  }




}
