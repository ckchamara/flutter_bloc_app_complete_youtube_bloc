import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/helpers/helper.dart';
import 'package:flutter_bloc_app_complete/blocs/workoutBloc/workout_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Workout Time"),
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.calendar_month)),
            IconButton(onPressed: null, icon: Icon(Icons.settings)),
          ],
        ),
        body: SingleChildScrollView(child:
            BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
          if (state is WorkoutDataFetchState) {
            return ExpansionPanelList.radio(
              children: state.workouts!
                  .map((workout) => ExpansionPanelRadio(
                      value: workout,
                      headerBuilder: (BuildContext context, bool isExpanded) =>
                          ListTile(
                            visualDensity: const VisualDensity(
                                vertical: 0,
                                horizontal: VisualDensity.minimumDensity),
                            leading: IconButton(
                              onPressed: () =>
                                  BlocProvider.of<WorkoutBloc>(context).add(
                                      EditWorkoutListEvent(
                                          workout.exercises, workout.title)),
                              icon: const Icon(Icons.edit),
                            ),
                            title: Text(workout.title.toString()),
                            trailing:
                                Text(formatDuration(workout.workoutDuration)),
                            onTap: null,
                          ),
                      body: ListView.builder(
                          shrinkWrap: true,
                          itemCount: workout.exercises.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                                onTap: null,
                                visualDensity: const VisualDensity(
                                    vertical: 0,
                                    horizontal: VisualDensity.minimumDensity),
                                leading: Text(formatDuration(
                                    workout.exercises[index].prelude)),
                                title: Text(workout.exercises[index].title),
                                trailing: Text(formatDuration(
                                    workout.exercises[index].duration)),
                              ))))
                  .toList(),
            );
          }

          return Container();
        })));
  }
}
