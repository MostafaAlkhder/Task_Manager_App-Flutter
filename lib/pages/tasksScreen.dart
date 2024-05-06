import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => TtasksScreenState();
}

class TtasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("TasksScreen");
  }
}
