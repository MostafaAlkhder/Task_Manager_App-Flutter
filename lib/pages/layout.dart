import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/provider/homeProvider.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    HomeProvider _authProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout"),
      ),
      body: _authProvider.screens[_authProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Task"),
        ],
        elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _authProvider.currentIndex,
        onTap: (index) {
          _authProvider.changeIndex(index);
        },
      ),
    );
  }
}
