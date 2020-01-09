import './Task.dart';

class Tasks{

  List<Task> loadTask(){
    List<Task> tasks =[new Task("attendance"),
    new Task("diary"),
    new Task("homework"),
      new Task("attendance"),
      new Task("diary"),
      new Task("homework"),
      new Task("attendance"),
      new Task("diary"),
      new Task("homework"),];
    return tasks;
  }
}