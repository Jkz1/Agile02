import 'package:flutter/foundation.dart';

class DonationModel extends ChangeNotifier {
  double _totalSaldo = 110.0;
  double _danaSekarang = 50.0;

  double get totalSaldo => _totalSaldo;
  double get danaSekarang => _danaSekarang;

  void setTotalSaldo(double saldo) {
    _totalSaldo = saldo;
    notifyListeners();
  }

  void setDanaSekarang(double dana) {
    _danaSekarang = dana;
    notifyListeners();
  }
}
