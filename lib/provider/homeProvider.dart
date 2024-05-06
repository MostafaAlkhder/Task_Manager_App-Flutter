import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/pages/addTaskScreen.dart';
import 'package:task_manager_app/pages/tasksScreen.dart';
import 'package:task_manager_app/provider/addTaskProvider.dart';
import 'package:task_manager_app/provider/taskProvider.dart';

class HomeProvider with ChangeNotifier {
  int currentIndex = 0;
  List<Widget> screens = [
    ChangeNotifierProvider<TaskProvider>(
      create: (context) => TaskProvider(),
      child: TasksScreen(),
    ),
    ChangeNotifierProvider<AddTaskProvider>(
      create: (context) => AddTaskProvider(),
      child: AddScreen(),
    ),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
