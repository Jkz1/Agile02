import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  // Debug no Login
  String _userLogin = "user1";
  String _userAccbankID = "AB1";

  get userLogin => _userLogin;
  get userAccbankID => _userAccbankID;

  get listUsers => users;
  final List<Map<String, String>> users = [
    {
      "username": "user1",
      "nama": "User 1",
      "email": "user1@mail.com",
      "tanggal_lahir": "2023-06-26",
      "password": "1",
      "acc_bank_id": 'AB1'
    },
    {
      "username": "user2",
      "nama": "User 2",
      "email": "user2@mail.com",
      "tanggal_lahir": "2023-06-27",
      "password": "2",
      "acc_bank_id": 'AB2'
    },
    {
      "username": "test",
      "nama": "Test",
      "email": "test",
      "tanggal_lahir": "2023-06-27",
      "password": "123",
      "acc_bank_id": 'AB_TEST'
    },
  ];

  get accbank => _accbank;
  final List<Map<String, String>> _accbank = [
    {
      "acc_bank_id": "AB_DEFAULT",
      "username": "default",
      "nama_bank": "BANK DEFAULT YA",
      "norek": "1234567890",
      "nama_pemilik": "DEFAULT DEFAULT",
    },
    {
      "acc_bank_id": "AB1",
      "username": "user1",
      "nama_bank": "BANK CENTRAL ASIA",
      "norek": "1122334455",
      "nama_pemilik": "JOKO CH",
    },
    {
      "acc_bank_id": "AB2",
      "username": "user2",
      "nama_bank": "BANK CENTRAL EROPA",
      "norek": "2233445566",
      "nama_pemilik": "JOKO CH 2",
    },
    {
      "acc_bank_id": "AB_TEST",
      "username": "test",
      "nama_bank": "BANK KESEJAHTERAAN EKONOMI",
      "norek": "890729101",
      "nama_pemilik": "BANK USER TEST",
    },
  ];

  void register(String username, String nama, String email, String tgl_lahir,
      String password) {
    Map<String, String> newUser = {
      "username": username,
      "nama": nama,
      "email": email,
      "tanggal_lahir": tgl_lahir,
      "password": password
    };
    users.add(newUser);
    print(users);
    notifyListeners();
  }

  void login(String email, String password, Function(String username) onSuccess,
      Function(String) onError) {
    bool isLoginSuccessful = false;
    for (var user in users) {
      if (user['email'] == email && user['password'] == password) {
        isLoginSuccessful = true;
        isLoggedIn = true;
        _userLogin = user['username']!;
        break;
      }
    }

    if (isLoginSuccessful) {
      print('Selamat datang ${_userLogin}');
      onSuccess(_userLogin);
    } else {
      isLoginSuccessful = false;
      isLoggedIn = false;
      _userLogin = "";
      onError('Login gagal. Email atau password salah.');
    }

    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;
    _userLogin = '';

    notifyListeners();
  }

  // Fungsi Penarikan Dana
  String? statusPenarikan;
  get listWD => _listWD;
  final List<Map<String, dynamic>> _listWD = [
    {
      "username": "user1",
      "acc_bank_id": "AB1",
      "metode_penarikan": "antrian",
      "jumlah_penarikan": "100000",
      "status_penarikan": "0"
    },
    {
      "username": "user2",
      "acc_bank_id": "AB2",
      "metode_penarikan": "instan",
      "jumlah_penarikan": "100000",
      "status_penarikan": "1"
    },
    {
      "username": "user1",
      "acc_bank_id": "AB1",
      "metode_penarikan": "antrian",
      "jumlah_penarikan": "100000",
      "status_penarikan": "0"
    },
  ];

  void tarikSaldo(String username, String accBankId, String metodePenarikan,
      String jumlahWD) {
    if (metodePenarikan == "antrian") {
      statusPenarikan = "0";
    } else {
      statusPenarikan = "1";
    }

    Map<String, dynamic> newWD = {
      "username": username,
      "acc_bank_id": accBankId,
      "metode_penarikan": metodePenarikan,
      "jumlah_penarikan": jumlahWD,
      "status_penarikan": statusPenarikan,
    };

    listWD.add(newWD);
    notifyListeners();
  }
}
