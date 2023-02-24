import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/helpers/helper.dart';
import '../blocs/workoutBloc/workout_bloc.dart';

class EditExerciseScreen extends StatefulWidget {
  const EditExerciseScreen({Key? key}) : super(key: key);

  @override
  State<EditExerciseScreen> createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => BlocProvider.of<WorkoutBloc>(context)
                .add(const FetchWorkoutListEvent()),
          ),
          title: const Text("Workout Time"),
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.calendar_month)),
            IconButton(onPressed: null, icon: Icon(Icons.settings)),
          ],
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<WorkoutBloc, WorkoutState>(
            builder: (context, state) {
              EditWorkoutListState workoutState = state as EditWorkoutListState;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: workoutState.exercises.length,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    onTap: null,
                    visualDensity: const VisualDensity(
                        vertical: 0,
                        horizontal: VisualDensity.minimumDensity),
                    leading: Text(formatDuration(
                        workoutState.exercises[index].prelude)),
                    title: Text(workoutState.exercises[index].title),
                    trailing: Text(formatDuration(
                        workoutState.exercises[index].duration)),
                  ));
            },
          ),
        ));
  }
}
