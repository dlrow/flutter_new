import 'package:flutter/material.dart';
import '../model/Task.dart';
import '../model/Tasks.dart';


class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 8.0 / 9.0,
      // TODO: Build a grid of cards (102)
      children: <Widget>[  Container(
        padding: const EdgeInsets.all(8),
        child: const Text('He\'d have you all unravel at the'),
        color: Colors.green[100],
      ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution, they...'),
          color: Colors.green[600],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution, they...'),
          color: Colors.green[600],
        ),],
    ),
    );
  }
}

class BuildCard  {

// TODO: Make a collection of cards (102)

// Replace this entire method
  static List<Card> getCard() {
    List<Card> _buildGridCards(BuildContext context) {
      List<Task> tasks = new Tasks().loadTask();

      if (tasks == null || tasks.isEmpty) {
        return const <Card>[];
      }

      final ThemeData theme = Theme.of(context);
      // final NumberFormat formatter = NumberFormat.simpleCurrency(
      //   locale: Localizations.localeOf(context).toString());

      return tasks.map((task) {
        return Card(
          clipBehavior: Clip.antiAlias,
          // TODO: Adjust card heights (103)
          child: Column(
            // TODO: Center items on the card (103)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 11,
                child: Image.asset(
                  task.taskName,
                  // package: product.assetPackage,
                  // TODO: Adjust the box size (102)
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    // TODO: Align labels to the bottom and center (103)
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // TODO: Change innermost Column (103)
                    children: <Widget>[
                      // TODO: Handle overflowing labels (103)
                      Text(
                        task.taskName,
                        style: theme.textTheme.title,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        task.taskName,
                        //formatter.format(32),
                        style: theme.textTheme.body2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList();
    }
  }
}

