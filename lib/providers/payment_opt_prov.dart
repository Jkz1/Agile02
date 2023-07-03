import 'package:flutter/material.dart';

class PaymentOptProv extends ChangeNotifier{
  List<bool> _selectedOption = [
    true,
    true,
    true,
    true,
    true,
    true
  ];

  List<String> _paymentOption = [
    "QRIS - ShoppePay",
    "OVO",
    "Kartu Kredit",
    "Debit / Mbanking",
    "Dana",
    "PayPal",
  ];

  List<bool> get selectedOption => _selectedOption;
  List<String> get paymentOption => _paymentOption;

  set setselectedOption(val){
    _selectedOption = val;
    notifyListeners();
  }
  set setpaymentOption(val){
    _paymentOption = val;
    notifyListeners();
  }

  falseall(){
    _selectedOption = List.generate(6, (index) => false);
    notifyListeners();
  }

  setboxstatus(int index){
    _selectedOption[index] = true;
    notifyListeners();
  }

}