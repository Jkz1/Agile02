import 'package:flutter/material.dart';

class TrendingData extends ChangeNotifier {
  List<bool> _timeOpt = [true, false, false];
  int _selectedOptionIndex = 0;

  List<bool> get timeOpt => _timeOpt;
  int get selectedOptionIndex => _selectedOptionIndex;

  set timeOpt(List<bool> value) {
    _timeOpt = value;
    notifyListeners();
  }

  set selectedOptionIndex(int value) {
    _selectedOptionIndex = value;
    notifyListeners();
  }

  void changeOption(int idx) {
    for (int i = 0; i < _timeOpt.length; i++) {
      if (i == idx) {
        _timeOpt[i] = true;
      } else {
        _timeOpt[i] = false;
      }
    }
    notifyListeners();
  }
}
