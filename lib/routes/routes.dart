import 'package:flutter/cupertino.dart';
import '../screens/editWorkoutScreen.dart';
import '../screens/homeScreen.dart';
import '../screens/workout_in_progress_screen.dart';

Map<String, WidgetBuilder> routes = {
  // '/': (context) => const HomeScreen(),
  '/': (context) => const WorkoutInProgressScreen(),
  '/editWorkoutScreen': (context) => const EditWorkoutScreen(),
};
