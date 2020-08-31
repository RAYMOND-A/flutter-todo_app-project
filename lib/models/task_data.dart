import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Brush up my teeth'),
    Task(name: 'Take a bath'),
    Task(name: 'Go to work'),
  ];

  UnmodifiableListView<Task> get tasks {
    // unmodifiableListView is a list that can not be updated
    return UnmodifiableListView(
        _tasks); //we use this getter to read the task stored in the _tasks list
  } // in the TaskView class and also not to populate our list using the list.add method
  // hence we use unmodifiableListView and we set our tasks list to private check above ☝☝☝

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toogleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
