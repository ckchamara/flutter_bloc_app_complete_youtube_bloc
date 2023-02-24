import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

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
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        EditExerciseListState editWorkoutListState =
            state as EditExerciseListState;
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => BlocProvider.of<WorkoutBloc>(context)
                    .add(const FetchWorkoutListEvent()),
              ),
              title: Text(editWorkoutListState.title),
              actions: const [
                IconButton(onPressed: null, icon: Icon(Icons.calendar_month)),
                IconButton(onPressed: null, icon: Icon(Icons.settings)),
              ],
            ),
            body: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: editWorkoutListState.exercises.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                    onTap: null,
                    visualDensity: const VisualDensity(
                        vertical: 0, horizontal: VisualDensity.minimumDensity),
                    leading: NumberPicker(
                      value: editWorkoutListState.exercises[index].prelude,
                      itemHeight: 30,
                      minValue: 0,
                      maxValue: 3599,
                      haptics: true,
                      onChanged: (value) => null,
                    ),
                    title: Text(editWorkoutListState.exercises[index].title),
                    trailing: NumberPicker(
                        value: editWorkoutListState.exercises[index].duration,
                        itemHeight: 30,
                        minValue: 0,
                        maxValue: 3599,
                        haptics: true,
                        onChanged: (value) => null)),
              ),
            ));
      },
    );
  }
}
