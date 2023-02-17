import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_app_complete/screens/app.dart';

import 'modal/workouts.dart';

void main(){
  runApp(const WorkoutApp());
}

_fetchWorkoutListe() async {
  String json = await rootBundle.loadString('assets/workouts.json');
  int index= 0;
  var jsonlist = jsonDecode(json);
  List<WorkoutModel> workoutss = jsonlist.map((wrkout) {
    WorkoutModel singleWorkout = WorkoutModel.fromJson(wrkout, index);
    index++;
    return singleWorkout;
  }).toList();

}



