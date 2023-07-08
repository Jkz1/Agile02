// ignore_for_file: unnecessary_question_mark

import 'package:flutter/material.dart';

class ProvUtama extends ChangeNotifier {
  dynamic _islogin = "";

  int? indexlogin;

  dynamic _daftarakun = [
    {
      "username": "JokotiHD",
      "nama": "Joko",
      "email": "asd",
      "tanggal_lahir": DateTime(2003, 3, 14),
      "password": "asd",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [
        {
          "id": "218651",
          "status": "Proses",
          "jumlah": 10000,
          "tgl": DateTime(2023, 3, 1),
          "namaBank": "Central Asia",
          "metode": "antrian",
          "noRek": "019285123"
        },
      ],
      "diterima": [
        {
          "id": "19203",
          "pengirim": "Megawati",
          "tgl": DateTime(2023, 3, 1),
          "jumlah": 10000,
          "email": "megawati@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Semangat",
        },
        {
          "id": "19302",
          "pengirim": "Soekarno",
          "tgl": DateTime(2023, 3, 1),
          "jumlah": 20000,
          "email": "soekarno@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Main Only Up bang",
        },
        {
          "id": "12203",
          "pengirim": "Soeharto",
          "tgl": DateTime(2023, 3, 1),
          "jumlah": 41200,
          "email": "soeharto@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Main em el bang",
        },
      ],
      "dikirim": [
        {
          "id": "19203",
          "tgl": DateTime(2023, 3, 1),
          "penerima": "Megawati",
          "jumlah": 10000,
          "email": "megawati@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Semangat",
        },
        {
          "id": "19302",
          "tgl": DateTime(2023, 3, 1),
          "penerima": "Soekarno",
          "jumlah": 20000,
          "email": "soekarno@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Main Only Up bang",
        },
        {
          "id": "12203",
          "tgl": DateTime(2023, 3, 1),
          "penerima": "Soeharto",
          "jumlah": 41200,
          "email": "soeharto@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Main em el bang",
        },
      ]
    },
  ];

  dynamic get islogin => _islogin;
  dynamic get daftarakun => _daftarakun;

  set setislogin(val) {
    _islogin = val;
    notifyListeners();
  }

  void updateTotalPendapatan() {
    for (int i = 0; i < _daftarakun.length; i++) {
      int sumPendapatan = 0;
      int tempSekarang = 0;
      for (int j = 0; j < _daftarakun[i]["diterima"].length; j++) {
        sumPendapatan += _daftarakun[i]["diterima"][j]["jumlah"] as int;
      }
      for (int j = 0; j < _daftarakun[i]["penarikan"].length; j++) {
        tempSekarang += _daftarakun[i]["penarikan"][j]["jumlah"] as int;
      }
      int sumSekarang = sumPendapatan - tempSekarang;
      _daftarakun[i]["totalPendapatan"] = sumPendapatan;
      _daftarakun[i]["danaSekarang"] = sumSekarang;
    }
  }

  void login(String email, String password, Function(String username) onSuccess,
      Function(String) onError) {
    bool isLoginSuccessful = false;
    dynamic _userlogin = '';
    for (int i = 0; i < _daftarakun.length; i++) {
      if ((_daftarakun[i]['email'].toLowerCase() == email.toLowerCase()) &&
          (_daftarakun[i]['password'] == password)) {
        isLoginSuccessful = true;
        _islogin = _daftarakun[i];
        indexlogin = i;
        break;
      }
    }

    if (isLoginSuccessful) {
      onSuccess(_userlogin);
    } else {
      _userlogin = "";
      onError('Login gagal. Email atau password salah.');
    }
    notifyListeners();
  }

  void addakun(
    String username,
    String nama,
    String email,
    DateTime tanggal_lahir,
    String password,
  ) {
    _daftarakun.add({
      "username": username,
      "nama": nama,
      "email": email,
      "tanggal_lahir": tanggal_lahir,
      "password": password,
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [],
      "diterima": [],
      "dikirim": []
    });
  }

  // void transaksi(
  //   // {
  //   //       "id": "218651",
  //   //       "status" : "Proses",
  //   //       "jumlah": 10000,
  //   //       "tgl": DateTime(2023, 3, 1),
  //   //       "namaBank": "Central Asia",
  //   //       "metode": "antrian",
  //   //       "noRek": "019285123"
  //   //     },
  //   String metode
  // )
}
