// ignore_for_file: unnecessary_question_mark

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProvUtama extends ChangeNotifier {
  dynamic _islogin = "";

  int? indexlogin;

  dynamic _daftarakun = [
    {
      "username": "JokotiHD",
      "img" : "assets/PP/1.jpg",
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
        {
          "id": "218655",
          "jumlah": 10000,
          "tgl": DateTime(2023, 7, 20),
          "namaBank": "bank02",
          "metode": "antrian",
          "noRek": "019285127",
          "status": "Proses"
        }
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
          "jumlah": 100000,
          "metode": "Qris-shoppepay",
          "pesan": "Semangat",
        },
        {
          "id": "19302",
          "tgl": DateTime(2023, 3, 1),
          "penerima": "Soekarno",
          "jumlah": 220000,
          "metode": "Qris-shoppepay",
          "pesan": "Main Only Up bang",
        },
        {
          "id": "12203",
          "tgl": DateTime(2023, 3, 1),
          "penerima": "Soeharto",
          "jumlah": 10000,
          "metode": "Qris-shoppepay",
          "pesan": "Main em el bang",
        },
      ]
    },
    {
      "username": "User2",
      "img" : "assets/PP/8.jpg",
      "nama": "Jane Smith",
      "email": "abc123",
      "tanggal_lahir": DateTime(1985, 10, 12),
      "password": "abc123",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [
        {
          "id": "218666",
          "jumlah": 9000,
          "tgl": DateTime(2024, 6, 1),
          "namaBank": "bank02",
          "metode": "antrian",
          "noRek": "019285138",
          "status": "Proses"
        },
        {
          "id": "218665",
          "jumlah": 13000,
          "tgl": DateTime(2024, 5, 2),
          "namaBank": "bank02",
          "metode": "instan",
          "noRek": "019285137",
          "status": "Sukses"
        },
        {
          "id": "218664",
          "jumlah": 6000,
          "tgl": DateTime(2024, 4, 3),
          "namaBank": "bank02",
          "metode": "antrian",
          "noRek": "019285136",
          "status": "Proses"
        }
      ],
      "diterima": [
        {
          "id": "12204",
          "pengirim": "Sukarno",
          "tgl": DateTime(2023, 4, 10),
          "jumlah": 50000,
          "email": "sukarno@gmail.com",
          "metode": "Ovo",
          "pesan": "Terima kasih atas dukungannya",
        },
        {
          "id": "12206",
          "pengirim": "Jokowi",
          "tgl": DateTime(2023, 6, 15),
          "jumlah": 250000,
          "email": "jokowi@gmail.com",
          "metode": "Kartu Kredit",
          "pesan": "Selamat berbelanja!",
        }
      ],
      "dikirim": []
    },
    {
      "username": "User3",
      "img" : "assets/PP/6.jpg",
      "nama": "Michael Johnson",
      "email": "passw0rd",
      "tanggal_lahir": DateTime(1988, 7, 8),
      "password": "passw0rd",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [],
      "diterima": [
        {
          "id": "12204",
          "pengirim": "Sukarno",
          "tgl": DateTime(2023, 4, 10),
          "jumlah": 50000,
          "email": "sukarno@gmail.com",
          "metode": "Ovo",
          "pesan": "Terima kasih atas dukungannya",
        },
        {
          "id": "12205",
          "pengirim": "Megawati",
          "tgl": DateTime(2023, 5, 5),
          "jumlah": 35000,
          "email": "megawati@gmail.com",
          "metode": "Dana",
          "pesan": "Selamat ulang tahun!",
        },
        {
          "id": "12206",
          "pengirim": "Jokowi",
          "tgl": DateTime(2023, 6, 15),
          "jumlah": 250000,
          "email": "jokowi@gmail.com",
          "metode": "Kartu Kredit",
          "pesan": "Selamat berbelanja!",
        },
        {
          "id": "12207",
          "pengirim": "Prabowo",
          "tgl": DateTime(2023, 7, 20),
          "jumlah": 80000,
          "email": "prabowo@gmail.com",
          "metode": "Debit/Mbanking",
          "pesan": "Sukses selalu!",
        },
        {
          "id": "12208",
          "pengirim": "Anies",
          "tgl": DateTime(2023, 8, 12),
          "jumlah": 30000,
          "email": "anies@gmail.com",
          "metode": "PayPal",
          "pesan": "Selamat menikmati pembelian Anda!",
        },
        {
          "id": "12209",
          "pengirim": "Rizal",
          "tgl": DateTime(2023, 9, 8),
          "jumlah": 120000,
          "email": "rizal@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Terima kasih atas dukungan Anda!",
        },
      ],
      "dikirim": [
        {
          "id": "19209",
          "tgl": DateTime(2023, 9, 8),
          "penerima": "Lina",
          "jumlah": 25000,
          "metode": "Qris-shoppepay",
          "pesan": "Sukses selalu!",
        },
        {
          "id": "19210",
          "tgl": DateTime(2023, 10, 4),
          "penerima": "Rudi",
          "jumlah": 12000,
          "metode": "Ovo",
          "pesan": "Terima kasih atas dukungannya!",
        },
        {
          "id": "19211",
          "tgl": DateTime(2023, 11, 25),
          "penerima": "Dewi",
          "jumlah": 7000,
          "metode": "Dana",
          "pesan": "Semoga harimu menyenangkan!",
        }
      ]
    },
    {
      "username": "User4",
      "img" : "assets/PP/8.jpg",
      "nama": "Emily Brown",
      "email": "qwerty123",
      "tanggal_lahir": DateTime(1992, 12, 31),
      "password": "qwerty123",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [
        {
          "id": "218658",
          "jumlah": 25000,
          "tgl": DateTime(2023, 10, 4),
          "tujuan": "bank02",
          "metode": "instan",
          "noRek": "019285130",
          "status": "Sukses"
        },
        {
          "id": "218662",
          "jumlah": 4000,
          "tgl": DateTime(2024, 2, 9),
          "tujuan": "bank02",
          "metode": "antrian",
          "noRek": "019285134",
          "status": "Proses"
        }
      ],
      "diterima": [
        {
          "id": "12204",
          "pengirim": "Sukarno",
          "tgl": DateTime(2023, 4, 10),
          "jumlah": 50000,
          "email": "sukarno@gmail.com",
          "metode": "Ovo",
          "pesan": "Terima kasih atas dukungannya",
        },
        {
          "id": "12205",
          "pengirim": "Megawati",
          "tgl": DateTime(2023, 5, 5),
          "jumlah": 35000,
          "email": "megawati@gmail.com",
          "metode": "Dana",
          "pesan": "Selamat ulang tahun!",
        },
      ],
      "dikirim": []
    },
    {
      "username": "User5",
      "img" : "assets/PP/3.jpg",
      "nama": "David Wilson",
      "email": "p@ssw0rd",
      "tanggal_lahir": DateTime(1995, 3, 19),
      "password": "p@ssw0rd",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [],
      "diterima": [
        {
          "id": "12210",
          "pengirim": "Yusuf",
          "tgl": DateTime(2023, 10, 4),
          "jumlah": 52000,
          "email": "yusuf@gmail.com",
          "metode": "Ovo",
          "pesan": "Semoga harimu menyenangkan!",
        },
        {
          "id": "12211",
          "pengirim": "Ahmad",
          "tgl": DateTime(2023, 11, 25),
          "jumlah": 70000,
          "email": "ahmad@gmail.com",
          "metode": "Dana",
          "pesan": "Selamat berbelanja online!",
        },
      ],
      "dikirim": []
    },
    {
      "username": "User6",
      "img" : "assets/PP/9.jpg",
      "nama": "Sarah Davis",
      "email": "password1",
      "tanggal_lahir": DateTime(1987, 9, 2),
      "password": "password1",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [
        {
          "id": "218660",
          "jumlah": 7000,
          "tgl": DateTime(2023, 12, 18),
          "tujuan": "bank02",
          "metode": "instan",
          "noRek": "019285132"
        },
        {
          "id": "218661",
          "jumlah": 18000,
          "tgl": DateTime(2024, 1, 14),
          "tujuan": "bank02",
          "metode": "instan",
          "noRek": "019285133"
        },
        {
          "id": "218662",
          "jumlah": 4000,
          "tgl": DateTime(2024, 2, 9),
          "tujuan": "bank02",
          "metode": "antrian",
          "noRek": "019285134"
        }
      ],
      "diterima": [
        {
          "id": "12213",
          "pengirim": "Widodo",
          "tgl": DateTime(2024, 1, 14),
          "jumlah": 40000,
          "email": "widodo@gmail.com",
          "metode": "Debit/Mbanking",
          "pesan": "Terima kasih atas transaksinya!",
        }
      ],
      "dikirim": []
    },
    {
      "username": "User7",
      "img" : "assets/PP/2.jpg",
      "nama": "Daniel Martinez",
      "email": "abcd1234",
      "tanggal_lahir": DateTime(1991, 6, 15),
      "password": "abcd1234",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [],
      "diterima": [
        {
          "id": "12209",
          "pengirim": "Rizal",
          "tgl": DateTime(2023, 9, 8),
          "jumlah": 120000,
          "email": "rizal@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Terima kasih atas dukungan Anda!",
        },
        {
          "id": "12210",
          "pengirim": "Yusuf",
          "tgl": DateTime(2023, 10, 4),
          "jumlah": 52000,
          "email": "yusuf@gmail.com",
          "metode": "Ovo",
          "pesan": "Semoga harimu menyenangkan!",
        }
      ],
      "dikirim": [
        {
          "id": "19209",
          "tgl": DateTime(2023, 9, 8),
          "penerima": "Lina",
          "jumlah": 25000,
          "metode": "Qris-shoppepay",
          "pesan": "Sukses selalu!",
        }
      ]
    },
    {
      "username": "User8",
      "img" : "assets/PP/2.jpg",
      "nama": "Olivia Taylor",
      "email": "q1w2e3r4",
      "tanggal_lahir": DateTime(1993, 11, 7),
      "password": "q1w2e3r4",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [
        {
          "id": "218652",
          "jumlah": 15000,
          "tgl": DateTime(2023, 4, 10),
          "tujuan": "bank02",
          "metode": "antrian",
          "noRek": "019285124"
        },
        {
          "id": "218653",
          "jumlah": 5000,
          "tgl": DateTime(2023, 5, 5),
          "tujuan": "bank02",
          "metode": "instan",
          "noRek": "019285125"
        },
        {
          "id": "218654",
          "jumlah": 20000,
          "tgl": DateTime(2023, 6, 15),
          "tujuan": "bank02",
          "metode": "instan",
          "noRek": "019285126"
        }
      ],
      "diterima": [
        {
          "id": "12205",
          "pengirim": "Megawati",
          "tgl": DateTime(2023, 5, 5),
          "jumlah": 35000,
          "email": "megawati@gmail.com",
          "metode": "Dana",
          "pesan": "Selamat ulang tahun!",
        },
        {
          "id": "12206",
          "pengirim": "Jokowi",
          "tgl": DateTime(2023, 6, 15),
          "jumlah": 250000,
          "email": "jokowi@gmail.com",
          "metode": "Kartu Kredit",
          "pesan": "Selamat berbelanja!",
        },
        {
          "id": "12207",
          "pengirim": "Prabowo",
          "tgl": DateTime(2023, 7, 20),
          "jumlah": 80000,
          "email": "prabowo@gmail.com",
          "metode": "Debit/Mbanking",
          "pesan": "Sukses selalu!",
        },
        {
          "id": "12208",
          "pengirim": "Anies",
          "tgl": DateTime(2023, 8, 12),
          "jumlah": 30000,
          "email": "anies@gmail.com",
          "metode": "PayPal",
          "pesan": "Selamat menikmati pembelian Anda!",
        },
        {
          "id": "12209",
          "pengirim": "Rizal",
          "tgl": DateTime(2023, 9, 8),
          "jumlah": 120000,
          "email": "rizal@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Terima kasih atas dukungan Anda!",
        },
        {
          "id": "12210",
          "pengirim": "Yusuf",
          "tgl": DateTime(2023, 10, 4),
          "jumlah": 52000,
          "email": "yusuf@gmail.com",
          "metode": "Ovo",
          "pesan": "Semoga harimu menyenangkan!",
        },
      ],
      "dikirim": []
    },
    {
      "img" : "assets/PP/6.jpg",
      "username": "User9",
      "nama": "James Anderson",
      "email": "pass1234",
      "tanggal_lahir": DateTime(1989, 4, 23),
      "password": "pass1234",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [],
      "diterima": [
        {
          "id": "12211",
          "pengirim": "Ahmad",
          "tgl": DateTime(2023, 11, 25),
          "jumlah": 70000,
          "email": "ahmad@gmail.com",
          "metode": "Dana",
          "pesan": "Selamat berbelanja online!",
        },
        {
          "id": "12212",
          "pengirim": "Siti",
          "tgl": DateTime(2023, 12, 18),
          "jumlah": 180000,
          "email": "siti@gmail.com",
          "metode": "Kartu Kredit",
          "pesan": "Enjoy your purchase!",
        },
        {
          "id": "12213",
          "pengirim": "Widodo",
          "tgl": DateTime(2024, 1, 14),
          "jumlah": 40000,
          "email": "widodo@gmail.com",
          "metode": "Debit/Mbanking",
          "pesan": "Terima kasih atas transaksinya!",
        },
        {
          "id": "19203",
          "pengirim": "Soeharto",
          "tgl": DateTime(2023, 3, 1),
          "jumlah": 41200,
          "email": "soeharto@gmail.com",
          "metode": "Qris-shoppepay",
          "pesan": "Main em el bang",
        },
        {
          "id": "19204",
          "pengirim": "Sukarno",
          "tgl": DateTime(2023, 4, 10),
          "jumlah": 50000,
          "email": "sukarno@gmail.com",
          "metode": "Ovo",
          "pesan": "Terima kasih atas dukungannya",
        },
        {
          "id": "19205",
          "pengirim": "Megawati",
          "tgl": DateTime(2023, 5, 5),
          "jumlah": 35000,
          "email": "megawati@gmail.com",
          "metode": "Dana",
          "pesan": "Selamat ulang tahun!",
        },
        {
          "id": "19206",
          "pengirim": "Jokowi",
          "tgl": DateTime(2023, 6, 15),
          "jumlah": 250000,
          "email": "jokowi@gmail.com",
          "metode": "Kartu Kredit",
          "pesan": "Selamat berbelanja!",
        },
        {
          "id": "19207",
          "pengirim": "Prabowo",
          "tgl": DateTime(2023, 7, 20),
          "jumlah": 80000,
          "email": "prabowo@gmail.com",
          "metode": "Debit/Mbanking",
          "pesan": "Sukses selalu!",
        },
      ],
      "dikirim": [
        {
          "id": "19210",
          "tgl": DateTime(2023, 10, 4),
          "penerima": "Rudi",
          "jumlah": 12000,
          "email": "rudi@gmail.com",
          "metode": "Ovo",
          "pesan": "Terima kasih atas dukungannya!",
        },
        {
          "id": "19211",
          "tgl": DateTime(2023, 11, 25),
          "penerima": "Dewi",
          "jumlah": 7000,
          "email": "dewi@gmail.com",
          "metode": "Dana",
          "pesan": "Semoga harimu menyenangkan!",
        }
      ]
    },
    {
      "username": "User10",
      "img" : "assets/PP/4.jpg",
      "nama": "Emma Johnson",
      "email": "qwertyui",
      "tanggal_lahir": DateTime(1994, 8, 11),
      "password": "qwertyui",
      "totalPendapatan": 0,
      "danaSekarang": 0,
      "penarikan": [],
      "diterima": [],
      "dikirim": [
        {
          "id": "19211",
          "tgl": DateTime(2023, 11, 25),
          "penerima": "Dewi",
          "jumlah": 7000,
          "metode": "Dana",
          "pesan": "Semoga harimu menyenangkan!",
        },
        {
          "id": "19212",
          "tgl": DateTime(2023, 12, 18),
          "penerima": "Agus",
          "jumlah": 18000,
          "metode": "Kartu Kredit",
          "pesan": "Selamat berbelanja online!",
        },
        {
          "id": "19213",
          "tgl": DateTime(2024, 1, 14),
          "penerima": "Linda",
          "jumlah": 4000,
          "metode": "Debit/Mbanking",
          "pesan": "Enjoy your purchase!",
        }
      ]
    }
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

  void transaksi(
    String metode,
    String noRek,
    String namaBank,
    String jumlah,
  ) {
    var uuid = Uuid();
    var uniqId = uuid.v1();

    _daftarakun[indexlogin]["penarikan"].add(
      {
        "id": uniqId,
        "status": "Proses",
        "jumlah": int.parse(jumlah),
        "tgl": DateTime.now(),
        "namaBank": namaBank,
        "metode": metode,
        "noRek": noRek
      },
    );
    _daftarakun[indexlogin]["danaSekarang"] -= int.parse(jumlah);
    _islogin = _daftarakun[indexlogin];
    notifyListeners();
  }
}
