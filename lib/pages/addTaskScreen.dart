import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/provider/addTaskProvider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    AddTaskProvider _addTaskProvider = Provider.of<AddTaskProvider>(context);

    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              _addTaskProvider.changeg();
            },
            child: Text("Weeeeeee")),
        Text("${_addTaskProvider.g}"),
      ],
    );
  }
}
