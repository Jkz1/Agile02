import 'package:flutter/material.dart';

class pageProv extends ChangeNotifier{
  int _selectedPage = 0;

  int get selectedPage  => _selectedPage;

  set setselectedPage(val){
    _selectedPage = val;
    notifyListeners();
  }

}