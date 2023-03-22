import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workoutBloc/workout_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workoutBloc/workout_bloc.dart';

import '../blocs/helpers/helper.dart';

class WorkoutInProgressScreen extends StatefulWidget {
  const WorkoutInProgressScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutInProgressScreen> createState() =>
      _WorkoutInProgressScreenState();
}

class _WorkoutInProgressScreenState extends State<WorkoutInProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          if(state is WorkoutInProgressState) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(state.workout.title.toString()),
                  leading: BackButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/')
                  ),
                ),
                body: Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: Colors.blue[100],
                        minHeight: 10,
                        value: 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${state}'),
                            DotsIndicator(
                              dotsCount: state.workout.getTotalExercises(),
                              position: 3,
                            ),
                            Text('-${formatDuration(state.workout.getTotalWorkoutTime())}')
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          // if (state is WorkoutInProgress) {
                          //   BlocProvider.of<WorkoutCubit>(context).pauseWorkout();
                          // } else if (state is WorkoutPaused) {
                          //   BlocProvider.of<WorkoutCubit>(context)
                          //       .resumeWorkout();
                          // }
                        },
                        child: Stack(
                          alignment: Alignment(0, 0),
                          children: [
                            const Center(
                              child: SizedBox(
                                height: 220,
                                width: 220,
                                child: CircularProgressIndicator(
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                                  strokeWidth: 25,
                                  value: 0.3,
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: 300,
                                width: 300,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Image.asset('assets/stopwatch.png'),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          }
          return Container();
        },
        listener: (context, state) {});
  }
}
