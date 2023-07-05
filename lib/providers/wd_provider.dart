import 'package:flutter/material.dart';

class WDProvider extends ChangeNotifier {
  String? statusPenarikan;
  final List<Map<String, dynamic>> listWD = [
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

    print('Metode Penarikan: $metodePenarikan');
    print('Jumlah Penarikan: $jumlahWD');
    print(listWD);
  }
}
