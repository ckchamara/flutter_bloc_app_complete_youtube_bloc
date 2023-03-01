import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/modal/exercise.dart';
import 'package:numberpicker/numberpicker.dart';

class EditExerciseWidget extends StatefulWidget {
  ExerciseModel exerciseModel;
  int? index;

  EditExerciseWidget({Key? key, required this.exerciseModel, this.index})
      : super(key: key);

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
        TextEditingController(text: widget.exerciseModel.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: null,
        visualDensity: const VisualDensity(
            vertical: 0, horizontal: VisualDensity.minimumDensity),
        leading: NumberPicker(
          value: widget.exerciseModel.prelude,
          itemHeight: 30,
          minValue: 0,
          maxValue: 3599,
          haptics: true,
          onChanged: (value) {

          },
        ),
        title: TextField(
          textAlign: TextAlign.center,
          controller: _textEditingController,
        ),
        trailing: InkWell(
          onLongPress: (){
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                content: Text("Edit Duration"),
                actions: [
                  OutlinedButton(onPressed: (){

                  }, child: Text("Save"))
                ],
              );
            });
          },
          child: NumberPicker(
              value: widget.exerciseModel.duration,
              itemHeight: 30,
              minValue: 0,
              maxValue: 3599,
              haptics: true,
              onChanged: (value) {
                setState(() {

                });
              }),
        ));
  }
}
