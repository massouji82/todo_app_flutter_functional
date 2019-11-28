import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  static final List<dynamic> _tasks = [];

  final Map<dynamic, dynamic> db = {
    _tasks: _tasks,
  };

  subscribe({@required String event}) {
    switch (event) {
      case 'getTasks':
        return db[_tasks];
      case 'countTasks':
        return db[_tasks].length;
      default:
        return null;
    }
  }

  dispatch({@required String event}) {
    switch (event) {
      case 'deleteTask':
        return (String task) {
          db[_tasks].remove(task);
          notifyListeners();
        };
      case 'addTask':
        return (final String newTaskTitle) {
          if (newTaskTitle == null || newTaskTitle.isEmpty) {
            return;
          }
          db[_tasks].add(newTaskTitle);
          notifyListeners();
        };
      default:
        return db[_tasks];
    }
  }
}
