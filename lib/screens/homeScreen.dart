import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                            leading: const IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: null,
                            ),
                            title: Text(workout.title.toString()),
                            trailing: const Text("null"),
                            onTap: null,
                          ),
                      body: ListView.builder(
                          shrinkWrap: true,
                          itemCount: workout.exercises!.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                                onTap: null,
                                visualDensity: const VisualDensity(
                                    vertical: 0,
                                    horizontal: VisualDensity.minimumDensity),
                                leading: Text(workout.exercises![index].prelude!
                                    .toString()),
                                title: Text(workout.exercises![index].title!),
                                trailing: Text(workout
                                    .exercises![index]!.duration!
                                    .toString()),
                              ))))
                  .toList(),
            );
          }

          return Container();
        })));
  }
}
