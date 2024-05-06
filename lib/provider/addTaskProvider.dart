import 'package:flutter/material.dart';

class AddTaskProvider with ChangeNotifier {
  int g = 0;
  void changeg() {
    g++;
    notifyListeners();
  }
}
