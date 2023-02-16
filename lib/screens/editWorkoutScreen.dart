import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/widgets/editExerciseWidget.dart';

import '../blocs/helpers/helper.dart';
import '../blocs/workoutBloc/workout_bloc.dart';

class EditWorkoutScreen extends StatelessWidget {
  const EditWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        EditWorkoutListState editWorkoutListState =
            state as EditWorkoutListState;
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
                    itemBuilder: (BuildContext context, int index) {
                      if (state.exIndex == index) {
                        return EditExerciseWidget(
                            exerciseModel:
                                editWorkoutListState.exercises[index]);
                      } else {
                        return ListTile(
                            visualDensity: const VisualDensity(
                                vertical: 0,
                                horizontal: VisualDensity.minimumDensity),
                            leading: Text(formatDuration(
                                editWorkoutListState.exercises[index].prelude)),
                            title: Text(
                                editWorkoutListState.exercises[index].title),
                            trailing: Text(formatDuration(editWorkoutListState
                                .exercises[index].duration)),
                            onTap: () {
                              BlocProvider.of<WorkoutBloc>(context).add(
                                  EditWorkoutListEvent(
                                      editWorkoutListState.exercises,
                                      editWorkoutListState.title,
                                      exIndex: index));
                            });
                      }
                    })));
      },
    );
  }


}
