import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  String userLogin = "";
  final List<Map<String, String>> users = [
    {"email": "1", "password": "1"},
    {"email": "2", "password": "2"},
  ];
  void register(String email, String password, Function() onSuccess,
      Function(String) onError) {
    print(users);
    Map<String, String> newUser = {'email': email, 'password': password};
    users.add(newUser);
    print(users);
    notifyListeners();
  }

  void login(String email, String password, Function() onSuccess,
      Function(String) onError) {
    // Proses validasi login
    // Jika login berhasil, set isLoggedIn menjadi true dan simpan data login
    bool isLoginSuccessful = false;
    for (var user in users) {
      if (user['email'] == email && user['password'] == password) {
        isLoginSuccessful = true;
        isLoggedIn = true;
        userLogin = email;
        break;
      }
    }

    if (isLoginSuccessful) {
      print('Selamat datang ${userLogin}');

      // Panggil callback onSuccess untuk melakukan perubahan status login
      onSuccess();
    } else {
      isLoginSuccessful = false;
      isLoggedIn = false;
      userLogin = "";
      // Panggil callback onError dengan pesan kesalahan
      onError('Login gagal. Email atau password salah.');
    }

    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;

    notifyListeners();
  }
}
