import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  // Debug  Login
  String _userLogin = "";

  get isLoggedIn => _isLoggedIn;
  get userLogin => _userLogin;

  set setLoggedIn(val) {
    _isLoggedIn = val;
  }

  set setUserLogin(val) {
    _userLogin = val;
  }

  final List<Map<String, dynamic>> users = [
    {
      "username": "test",
      "nama": "Test",
      "email": "test",
      "tanggal_lahir": "2023-06-27",
      "password": "123",
      "job": ["Streamer, ", "Content Creator"],
      "img_profil": "assets/jokowi.jpg",
      "desc":
          "Haloo semua! perkenalkan nama saya joko widodo. Saya adalah seorang streamer di twitch dan youtube yang biasanya saya live random, tapi biasanya saya suka react meme tentang pemerintahan kita yang lucu >< \n \nJangan lupa support saya lewat bagibagi yaa. Setiap donasi yang kalian berikan sangat berarti bagi saya agar saya tetap semangat livenya hehe~ \n \nKalian yang sudah support saya juga bakal dapat kesempatan untuk main bareng saya dan tentunya kita bisa have fun bareng deh \n \nSegitu aja sih pengenalan singkat tentang saya. Jangan lupa follow bagibagi saya juga yaa, cyaa~",
      "youtube": "https://www.youtube.com/@Jokowi",
      "twitch": "https://www.twitch.tv/tarik",
      "diterima": [
        {
          "id_penerimaan": "IN-9121920",
          "username_pengirim": "PC1",
          "nama_pengirim": "Puan Cantik",
          "email_pengirim": "puanmega@mail.com",
          "tanggal": "2023-07-07",
          "jumlah_diterima": 1000000,
          "pesan": "Anggaran belanja dari DPR"
        },
        {
          "id_penerimaan": "IN-9121920",
          "username_pengirim": "PC1",
          "nama_pengirim": "Puan Cantik",
          "email_pengirim": "puanmega@mail.com",
          "tanggal": "2023-07-07",
          "jumlah_diterima": 200000,
          "pesan": "Uang jajan"
        }
      ],
      "dikirim": [
        {
          "id_pengiriman": "IN-9121920",
          "username_penerima": "gilang69",
          "nama_pengirim": "Gilang Sakti",
          "email_pengirim": "gsakti@mail.com",
          "tanggal": "2023-07-08",
          "jumlah_dikirim": 100000,
          "pesan": "Tetatp semangat ya kak"
        }
      ],
      "penarikan_dana": [
        {
          "id_wd": "WD-09028190",
          "nama_bank": "BANK DEFAULT YA",
          "norek": "1234567890",
          "nama_pemilik": "DEFAULT DEFAULT",
          "metode_penarikan": "antrian",
          "jumlah_penarikan": 100000,
          "tanggal_penarikan": "2023-07-07",
          "status_penarikan": "0"
        }
      ]
    },

    {
      "username": "user1",
      "nama": "User 1",
      "email": "User1",
      "tanggal_lahir": "2023-06-27",
      "password": "123",
      "job": ["Streamer, ", "Content Creator"],
      "img_profil": "assets/jokowi.jpg",
      "desc":
          "Haloo semua! perkenalkan nama saya joko widodo. Saya adalah seorang streamer di twitch dan youtube yang biasanya saya live random, tapi biasanya saya suka react meme tentang pemerintahan kita yang lucu >< \n \nJangan lupa support saya lewat bagibagi yaa. Setiap donasi yang kalian berikan sangat berarti bagi saya agar saya tetap semangat livenya hehe~ \n \nKalian yang sudah support saya juga bakal dapat kesempatan untuk main bareng saya dan tentunya kita bisa have fun bareng deh \n \nSegitu aja sih pengenalan singkat tentang saya. Jangan lupa follow bagibagi saya juga yaa, cyaa~",
      "youtube": "https://www.youtube.com/@Jokowi",
      "twitch": "https://www.twitch.tv/tarik",
      "diterima": [
        {
          "id_penerimaan": "IN-9121920",
          "username_pengirim": "test1",
          "nama_pengirim": "aioshoaishoa",
          "email_pengirim": "sasasa@mail.com",
          "tanggal": "2023-07-07",
          "jumlah_diterima": 100000000,
          "pesan": "asdgaUIDGaudAD"
        },
        {
          "id_penerimaan": "IN-9121920",
          "username_pengirim": "PC1",
          "nama_pengirim": "Puan Cantik",
          "email_pengirim": "puanmega@mail.com",
          "tanggal": "2023-07-07",
          "jumlah_diterima": 50000000,
          "pesan": "Uang jajan"
        }
      ],
      "dikirim": [
        // {
        //   "id_pengiriman": "IN-9121920",
        //   "username_penerima": "test",
        //   "nama_pengirim": "JOKO CH",
        //   "email_pengirim": "sudysid@mail.com",
        //   "tanggal": "2023-07-08",
        //   "jumlah_dikirim": 100000,
        //   "pesan": "Tetatp semangat ya kak"
        // }
      ],
      "penarikan_dana": [
        {
          "id_wd": "WD-09028190",
          "nama_bank": "BANK DEFAULT YA",
          "norek": "1234567890",
          "nama_pemilik": "DEFAULT DEFAULT",
          "metode_penarikan": "antrian",
          "jumlah_penarikan": 100000,
          "tanggal_penarikan": "2023-07-07",
          "status_penarikan": "0"
        }
      ]
    },
    // Rest of the user data
  ];

  // Fungsi Donate
  void donate(
    String usernamePenerima,
    String usernamePengirim,
    String nominalpengirim,
    String namaPengirim,
    String emailPengirim,
    String pesanPengirim,
  ) {
    int nominalPengirim = int.parse(nominalpengirim);
    Map<String, dynamic> newDiterima = {
      "id_penerimaan": "IN-9121920",
      "username_pengirim": usernamePengirim,
      "nama_pengirim": namaPengirim,
      "email_pengirim": emailPengirim,
      "tanggal": "2023-07-07",
      "jumlah_diterima": nominalPengirim,
      "pesan": pesanPengirim
    };

    Map<String, dynamic> newDikirim = {
      "id_pengiriman": "IN-9121920",
      "username_penerima": usernamePenerima,
      "nama_pengirim": namaPengirim,
      "email_pengirim": namaPengirim,
      "tanggal": "2023-07-08",
      "jumlah_dikirim": nominalPengirim,
      "pesan": pesanPengirim
    };

    // Cari pengguna dengan username pengirim
    int pengirimIndex =
        users.indexWhere((user) => user['username'] == usernamePengirim);
    if (pengirimIndex != -1) {
      List<Map<String, dynamic>> dikirim =
          users[pengirimIndex]['dikirim'] != null
              ? List<Map<String, dynamic>>.from(users[pengirimIndex]['dikirim'])
              : [];
      dikirim.add(newDikirim);
      users[pengirimIndex]['dikirim'] = dikirim;
    }

    // Cari pengguna dengan username penerima
    int penerimaIndex =
        users.indexWhere((user) => user['username'] == usernamePenerima);
    if (penerimaIndex != -1) {
      List<Map<String, dynamic>> diterima = users[penerimaIndex]['diterima'] !=
              null
          ? List<Map<String, dynamic>>.from(users[penerimaIndex]['diterima'])
          : [];
      diterima.add(newDiterima);
      users[penerimaIndex]['diterima'] = diterima;
    }

    notifyListeners();
  }

  int sumTotalPendapatan(String username) {
    int sumDiterima = users
        .where((user) => user['username'] == username)
        .expand((user) => user['diterima'])
        .map<int>((diterima) => diterima['jumlah_diterima'] ?? 0)
        .fold(0, (sum, jumlah) => sum + jumlah);

    return sumDiterima;
  }

  int sumSaldo(String username) {
    int sumDiterima = users
        .where((user) => user['username'] == username)
        .expand((user) => user['diterima'])
        .map<int>((diterima) => diterima['jumlah_diterima'] ?? 0)
        .fold(0, (sum, jumlah) => sum + jumlah);

    int sumPenarikan = users
        .where((user) => user['username'] == username)
        .expand((user) => user['penarikan_dana'])
        .map<int>((penarikan) => penarikan['jumlah_penarikan'] ?? 0)
        .fold(0, (sum, jumlah) => sum + jumlah);

    return sumDiterima - sumPenarikan;
  }

// Fungsi Penarikan Dana
  void tarikSaldo(String username, String metodePenarikan, String jumlahWD,
      String namabank, String noRek, String aN) {
    String statusPenarikan;
    if (metodePenarikan == "antrian") {
      statusPenarikan = "0";
    } else {
      statusPenarikan = "1";
    }
    int jumlahPenarikan = int.parse(jumlahWD);
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    Map<String, dynamic> newWD = {
      "id_wd": "WD-09028190",
      "nama_bank": namabank,
      "norek": noRek,
      "nama_pemilik": aN,
      "metode_penarikan": metodePenarikan,
      "jumlah_penarikan": jumlahPenarikan,
      "tanggal_penarikan": currentDate,
      "status_penarikan": statusPenarikan
    };

    // Cari pengguna dengan username yang sesuai
    int userIndex = users.indexWhere((user) => user['username'] == username);
    if (userIndex != -1) {
      // Dapatkan data penarikan dana
      List<Map<String, dynamic>>? penarikanDana =
          users[userIndex]['penarikan_dana'];
      if (penarikanDana != null) {
        // Buat list baru dengan data penarikan dana yang sudah ada ditambah data penarikan baru
        List<Map<String, dynamic>> updatedPenarikanDana = [
          ...penarikanDana,
          newWD
        ];
        // Assign list baru ke kunci penarikan_dana
        users[userIndex]['penarikan_dana'] = updatedPenarikanDana;
      } else {
        // Jika data penarikan dana belum ada, buat list baru hanya dengan data penarikan baru
        List<Map<String, dynamic>> newPenarikanDana = [newWD];
        // Assign list baru ke kunci penarikan_dana
        users[userIndex]['penarikan_dana'] = newPenarikanDana;
      }
      print(users[userIndex]['penarikan_dana']);
    }

    notifyListeners();
  }

  final List<Map<String, String>> accbank = [
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

  void register(String username, String nama, String email, String tglLahir,
      String password) {
    Map<String, String> newUser = {
      "username": username,
      "nama": nama,
      "email": email,
      "tanggal_lahir": tglLahir,
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
        _isLoggedIn = true;
        _userLogin = user['username']!;
        break;
      }
    }

    if (isLoginSuccessful) {
      print('Selamat datang ${_userLogin}');
      onSuccess(_userLogin);
    } else {
      isLoginSuccessful = false;
      _isLoggedIn = false;
      _userLogin = "";
      onError('Login gagal. Email atau password salah.');
    }

    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userLogin = '';

    notifyListeners();
  }
}
