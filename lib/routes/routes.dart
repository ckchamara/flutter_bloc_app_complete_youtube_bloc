import 'package:flutter/cupertino.dart';
import '../screens/editWorkoutScreen.dart';
import '../screens/homeScreen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomeScreen(),
  '/editWorkoutScreen': (context) => const EditWorkoutScreen(),
};