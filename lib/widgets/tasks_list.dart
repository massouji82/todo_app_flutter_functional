import 'package:flutter/material.dart';
import 'package:todo_app_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/models/task_data_functional.dart';

class TasksList extends StatelessWidget {
  static bool isDone;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.subscribe(event: 'getTasks')[index];
            return TaskTile(
              taskTitle: task,
              isChecked: isDone = false,
              checkboxCallback: (checkboxState) {
                isDone = !isDone;
              },
              longPressCallback: () {
                taskData.dispatch(event: 'deleteTask')(task);
              },
            );
          },
          itemCount: taskData.subscribe(event: 'countTasks'),
        );
      },
    );
  }
}
