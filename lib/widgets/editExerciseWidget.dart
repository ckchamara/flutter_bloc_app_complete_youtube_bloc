import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/modal/exercise.dart';
import 'package:numberpicker/numberpicker.dart';

import '../modal/workouts.dart';

class EditExerciseWidget extends StatefulWidget {
  WorkoutModel workout;
  int exIndex;

  EditExerciseWidget({super.key, required this.workout, required this.exIndex});

  @override
  State<EditExerciseWidget> createState() => _EditExerciseWidgetState();
}

class _EditExerciseWidgetState extends State<EditExerciseWidget> {
  TextEditingController? _textEditingController;
  int preludeValue = 0;
  int durationValue = 0;

  @override
  void initState() {
    _textEditingController =
        TextEditingController(text: widget.workout.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: null,
        visualDensity: const VisualDensity(
            vertical: 0, horizontal: VisualDensity.minimumDensity),
        leading: InkWell(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text("Edit Prelude"),
                    actions: [
                      const TextField(
                        textAlign: TextAlign.center,
                        decoration:
                            InputDecoration(hintText: "Prelude(in Seconds)"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {}, child: const Text("Save")),
                    ],
                  );
                });
          },
          child: NumberPicker(
            value: widget.workout.exercises[widget.exIndex].prelude,
            itemHeight: 30,
            minValue: 0,
            maxValue: 3599,
            haptics: true,
            onChanged: (value) {},
          ),
        ),
        title: TextField(
          textAlign: TextAlign.center,
          controller: _textEditingController,
        ),
        trailing: InkWell(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text("Edit Duration"),
                    actions: [
                      const TextField(
                        textAlign: TextAlign.center,
                        decoration:
                            InputDecoration(hintText: "Duration(in Seconds)"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {}, child: const Text("Save")),
                    ],
                  );
                });
          },
          child: NumberPicker(
              value: widget.workout.exercises[widget.exIndex].duration,
              itemHeight: 30,
              minValue: 0,
              maxValue: 3599,
              haptics: true,
              onChanged: (value) {
                setState(() {});
              }),
        ));
  }
}
