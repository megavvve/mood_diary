import 'package:flutter/material.dart';

class SelfEsteemProvider extends ChangeNotifier {
  double _selfEsteemLevel = 0.0;

  double get selfEsteemLevel => _selfEsteemLevel;

  void setSelfEsteemLevel(double level) {
    _selfEsteemLevel = level;
    notifyListeners();
  }
}
