import 'package:flutter/material.dart';
import 'package:flutter_app/util/Constants.dart';
import '../model/Task.dart';
import '../model/Tasks.dart';

class TaskScreen extends StatelessWidget with Constants{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TASK_SCREEN_APP_BAR_TITLE),),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        // TODO: Build a grid of cards (102)
        children: BuildCard.buildGridCards(),
      ),
    );
  }
}

class BuildCard {
// TODO: Make a collection of cards (102)

// Replace this entire method
  static List<Card> buildGridCards() {
    List<Task> tasks = new Tasks().loadTask();

    if (tasks == null || tasks.isEmpty) {
      return const <Card>[];
    }

    return tasks.map((task) {
      return Card(
       child: Column(
         children: <Widget>[
           Icon(Icons.accessibility),
           Text(task.taskName),
         ],
      ),
      );
    }).toList();
  }
}
