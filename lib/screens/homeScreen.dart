import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
          child: ExpansionPanelList.radio(
            children: [
              ExpansionPanelRadio(
                value: 3,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return const ListTile(
                    title: Text('Panel 1'),
                  );
                },
                body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Content for Panel 3'),
                ),
              ),
              ExpansionPanelRadio(
                value: 7,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return const ListTile(
                    title: Text('Panel 2'),
                  );
                },
                body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Content for Panel 3'),
                ),
              ),
            ],
          ),
        ));
  }
}
