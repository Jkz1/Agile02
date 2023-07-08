import 'package:flutter/material.dart';

class TrendingData extends ChangeNotifier{
  List<bool> _timeOpt = [false, false, true];

  List<bool> get timeOpt => _timeOpt;

  set settimeOpt(val){
    _timeOpt = val;
    notifyListeners();
  }

  changeOption(int idx){
    for(int i = 0; i < 3; i++){
      if(i == idx){
        if(_timeOpt[i]){
          _timeOpt[i] = !_timeOpt[i];
        }
        else{
          _timeOpt[i] = true;
        }
      }else{
        _timeOpt[i] = false;
      }
    }
    notifyListeners();
  }

}