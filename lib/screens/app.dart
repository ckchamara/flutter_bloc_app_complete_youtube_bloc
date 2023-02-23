import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workoutBloc/workout_bloc.dart';
import 'package:flutter_bloc_app_complete/screens/editWorkoutScreen.dart';

import 'homeScreen.dart';

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "WorkoutTime",
        home: MultiBlocProvider(
            providers: [
              BlocProvider<WorkoutBloc>(
                  create: (BuildContext context) =>
                      WorkoutBloc()..add(const FetchWorkoutListEvent()))
            ],
            child: BlocBuilder<WorkoutBloc, WorkoutState>(
                builder: (context, state) {
              print("state is $state");
              if (state is WorkoutInitialState ||
                  state is WorkoutDataFetchState) {
                return const HomeScreen();
              }else if(state is EditWorkoutListState){
                return const EditWorkoutScreen();
              }
              return const Text("Something went wrong");
            })));
  }
}
