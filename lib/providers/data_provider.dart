import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  String userLogin = "";
  final List<Map<String, String>> users = [
    {
      "username": "user1",
      "nama": "User 1",
      "email": "user1@mail.com",
      "tanggal_lahir": "2023-06-26",
      "password": "1"
    },
    {
      "username": "user2",
      "nama": "User 2",
      "email": "user2@mail.com",
      "tanggal_lahir": "2023-06-27",
      "password": "2"
    },
  ];
  void register(String username, String nama, String email, String tgl_lahir,
      String password, Function() onSuccess, Function(String) onError) {
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
