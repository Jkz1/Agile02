import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/data_provider.dart';

class DonaturScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var donaturProvider = Provider.of<DataProvider>(context);
    var userLogin = donaturProvider.userLogin;
    var users = donaturProvider.users;

    // Cari indeks user yang sesuai dengan userLogin
    var penggunaIndex =
        users.indexWhere((user) => user['username'] == userLogin);
    var diterima = <Map<String, dynamic>>[];

    if (penggunaIndex != -1) {
      diterima = (users[penggunaIndex]['diterima'] as List<dynamic>)
          .cast<Map<String, dynamic>>();
    }

    return Center(
      child: Container(
        width: 500,
        height: 700,
        child: ListView.builder(
          itemCount: diterima.length,
          itemBuilder: (context, index) {
            var donasi = diterima[index];
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              color: Color(0xFFA2A2A2),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DonaturInfoRow(
                      label: 'Nama Pengirim',
                      value: donasi['nama_pengirim'],
                    ),
                    DonaturInfoRow(
                      label: 'Email Pengirim',
                      value: donasi['email_pengirim'],
                    ),
                    DonaturInfoRow(
                      label: 'Tanggal',
                      value: donasi['tanggal'],
                    ),
                    DonaturInfoRow(
                      label: 'Jumlah Diterima',
                      value:
                          'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(donasi['jumlah_diterima'])}',
                    ),
                    DonaturInfoRow(
                      label: 'Pesan',
                      value: donasi['pesan'],
                    ),
                    DonaturInfoRow(
                      label: 'Metode Pembayaran',
                      value: donasi['metode'],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DonaturInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const DonaturInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
