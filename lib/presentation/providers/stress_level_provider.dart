import 'package:flutter/material.dart';

class StressLevelProvider extends ChangeNotifier {
  double _stressLevel = 0;

  double get stressLevel => _stressLevel;

  void setStressLevel(double level) {
    _stressLevel = level;
    notifyListeners();
  }
}
