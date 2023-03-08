import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workoutBloc/workout_bloc.dart';
import 'package:flutter_bloc_app_complete/widgets/editExerciseWidget.dart';
import 'package:flutter_bloc_app_complete/screens/editWorkoutScreen.dart';

import '../routes/routes.dart';
import 'homeScreen.dart';

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<WorkoutBloc>(
          create: (BuildContext context) =>
          WorkoutBloc()..add(const FetchWorkoutListEvent()))
    ], child: MaterialApp(
        initialRoute: '/',
        routes: routes,
        title: "WorkoutTime",
      ),
    );
  }
}
