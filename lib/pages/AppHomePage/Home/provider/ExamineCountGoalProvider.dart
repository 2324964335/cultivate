import 'package:flutter/material.dart';

class ExamineCountGoalProvider with ChangeNotifier {
  int value = 10;
  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }

  void set(int value) {
    this.value = value;
  }
}