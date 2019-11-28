import 'package:flutter/material.dart';
import 'package:todo_app_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/models/task_data_functional.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
