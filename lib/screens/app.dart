import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workoutBloc/workout_bloc.dart';

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
                  print(state);
              if (state is WorkoutInitialState) {
                return const HomeScreen();
              }
              return const Text("Something went wrong");
            })));
  }
}
