// ignore_for_file: unnecessary_question_mark

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ProvUtama extends ChangeNotifier {
  dynamic _islogin = "";

  List<bool> _timeOpt = [false, false, true];

  int? indexlogin;

  dynamic _daftarakun = [
    {
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": "JokotiHD",
      "img": "assets/PP/1.jpg",
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
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": "User2",
      "img": "assets/PP/8.jpg",
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
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": "User3",
      "img": "assets/PP/6.jpg",
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
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": "User4",
      "img": "assets/PP/8.jpg",
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
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": "User5",
      "img": "assets/PP/3.jpg",
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
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": "User6",
      "img": "assets/PP/9.jpg",
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
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": "User7",
      "img": "assets/PP/2.jpg",
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
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": "User8",
      "img": "assets/PP/2.jpg",
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
      "img": "assets/PP/6.jpg",
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": "User10",
      "img": "assets/PP/4.jpg",
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
  List<bool> get timeOpt => _timeOpt;

  set setislogin(val) {
    _islogin = val;
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

  void donate(
      String usernamePenerima,
      String usernamePengirim,
      String nominalpengirim,
      String namaPengirim,
      String emailPengirim,
      String pesanPengirim,
      String metode) {
    DateTime currentDate = DateTime.now();
    var uuid = Uuid();
    int nominalPengirim = int.parse(nominalpengirim);
    Map<String, dynamic> newDiterima = {
      "id": uuid.v1(),
      "pengirim": namaPengirim,
      "email": emailPengirim,
      "tgl": currentDate,
      "jumlah": nominalPengirim,
      "pesan": pesanPengirim,
      "metode": metode
    };

    Map<String, dynamic> newDikirim = {
      "id": uuid.v1(),
      "penerima": namaPengirim,
      "tgl": currentDate,
      "jumlah": nominalPengirim,
      "pesan": pesanPengirim,
      "metode": metode
    };
    // Cari pengguna dengan username pengirim
    int pengirimIndex =
        _daftarakun.indexWhere((user) => user['username'] == usernamePengirim);
    if (pengirimIndex != -1) {
      List<Map<String, dynamic>> dikirim =
          _daftarakun[pengirimIndex]['dikirim'] != null
              ? List<Map<String, dynamic>>.from(
                  _daftarakun[pengirimIndex]['dikirim'])
              : [];
      dikirim.add(newDikirim);
      _daftarakun[pengirimIndex]['dikirim'] = dikirim;
    }

    // Cari pengguna dengan username penerima
    int penerimaIndex =
        _daftarakun.indexWhere((user) => user['username'] == usernamePenerima);
    if (penerimaIndex != -1) {
      List<Map<String, dynamic>> diterima =
          _daftarakun[penerimaIndex]['diterima'] != null
              ? List<Map<String, dynamic>>.from(
                  _daftarakun[penerimaIndex]['diterima'])
              : [];
      diterima.add(newDiterima);
      _daftarakun[penerimaIndex]['diterima'] = diterima;
    }

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
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "username": username,
      "nama": nama,
      "img" : "assets/jokowi.jpg",
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

  List<Map<String,dynamic>> sortedakun = [];

  void earlyAll(){
    
    dynamic _sorted = _daftarakun;
    int lengthOfArray = _sorted.length;
    for (int i = 0; i < lengthOfArray - 1; i++) {
      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        if (_sorted[j]["totalPendapatan"] < _sorted[j + 1]["totalPendapatan"]) {
          // Swapping using temporary variable
          dynamic temp = _sorted[j];
          _sorted[j] = _sorted[j + 1];
          _sorted[j + 1] = temp;
        }
      }
    }
    sortedakun = _sorted;

  }
  void byAll(){
    updateTotalPendapatan();
    
    dynamic _sortedall = _daftarakun;
    
    int lengthOfArray = _sortedall.length;
    for (int i = 0; i < lengthOfArray - 1; i++) {
      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        if (_sortedall[j]["totalPendapatan"] < _sortedall[j + 1]["totalPendapatan"]) {
          // Swapping using temporary variable
          dynamic temp = _sortedall[j];
          _sortedall[j] = _sortedall[j + 1];
          _sortedall[j + 1] = temp;
        }
      }
    }
    sortedakun = _sortedall;
    notifyListeners();
  }
  
  void byYear(){
    
    dynamic _sorted = _daftarakun;

    int _totalP = 0;

    for (int i = 0; i < _sorted.length; i++){
      for(int j = 0; j < _sorted[i]["diterima"].length; j++){
        if(_sorted[i]["diterima"][j]["tgl"].year == DateTime.now().year){
          _totalP += _sorted[i]["diterima"][j]["jumlah"] as int;
        }
      }
        _sorted[i]["totalPendapatan"] = _totalP;
        _totalP = 0;
    }

    int lengthOfArray = _sorted.length;
    for (int i = 0; i < lengthOfArray - 1; i++) {
      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        if (_sorted[j]["totalPendapatan"] < _sorted[j + 1]["totalPendapatan"]) {
          // Swapping using temporary variable
          dynamic temp = _sorted[j];
          _sorted[j] = _sorted[j + 1];
          _sorted[j + 1] = temp;
        }
      }
    }
    sortedakun = _sorted;
    notifyListeners();
  }
  void byMonth(){
    
    dynamic _sorted = _daftarakun;

    int _totalP = 0;

    for (int i = 0; i < _sorted.length; i++){
      for(int j = 0; j < _sorted[i]["diterima"].length; j++){
        if(_sorted[i]["diterima"][j]["tgl"].month == DateTime.now().month){
          _totalP += _sorted[i]["diterima"][j]["jumlah"] as int;
        }
      }
        _sorted[i]["totalPendapatan"] = _totalP;
        _totalP = 0;
    }

    int lengthOfArray = _sorted.length;
    for (int i = 0; i < lengthOfArray - 1; i++) {
      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        if (_sorted[j]["totalPendapatan"] < _sorted[j + 1]["totalPendapatan"]) {
          // Swapping using temporary variable
          dynamic temp = _sorted[j];
          _sorted[j] = _sorted[j + 1];
          _sorted[j + 1] = temp;
        }
      }
    }
    sortedakun = _sorted;
    notifyListeners();
  }

}
