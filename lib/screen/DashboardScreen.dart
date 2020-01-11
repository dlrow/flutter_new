import 'package:flutter/material.dart';
import 'package:flutter_app/util/Constants.dart';
import '../model/Task.dart';
import '../model/Tasks.dart';

class DashboardScreen extends StatelessWidget with Constants{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TASK_SCREEN_APP_BAR_TITLE),),
      body: Stack(
        children: <Widget>[background, content],
      ),
    );


  }

  get background => Column(
    children: <Widget>[
      Expanded(child: Container(color: Colors.blue),flex: 2,),
      Expanded(child: Container(color: Colors.transparent),flex: 5,),
    ],
  );


  get content => Container(
    child: Column(
      children: <Widget>[
        header,
        grid,
      ],
    ),
  );

  get header => ListTile(
    contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
    title: Text(
      //hello username
      'Hello Username',
      style: TextStyle(color: Colors.white),
    ),

    trailing: CircleAvatar(),
  );

  get grid => Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GridView.count(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: .90,
        children: BuildCard.buildGridCards(),
      ),
    ),
  );
}



class BuildCard {
 static List<Card> buildGridCards() {
    List<Task> tasks = new Tasks().loadTask();

    if (tasks == null || tasks.isEmpty) {
      return const <Card>[];
    }

    return tasks.map((task) {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
       child: Center(
         child : Column(
           mainAxisSize: MainAxisSize.min,

           children: <Widget>[
           Icon(Icons.accessibility),
           Text(task.taskName),
         ],
       ),),
      );
    }).toList();
  }
}
