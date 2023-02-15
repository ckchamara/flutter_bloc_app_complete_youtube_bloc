import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Time"),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.calendar_month)),
          IconButton(onPressed: null, icon: Icon(Icons.settings)),
        ],
      ),
      body: Column(
        children: [
          ExpansionPanelList.radio()
        ],
      ),
    );
  }
}
