import 'package:agile02/providers/donation_provider.dart';
import 'package:agile02/providers/provUtama.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/data_provider.dart';

class DonaturScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mainProv = Provider.of<ProvUtama>(context);
    var userLogin = mainProv.islogin;
    var riwayatdonatur = userLogin["diterima"];

    return Center(
      child: Container(
        width: 500,
        height: 500,
        child: ListView.builder(
          itemCount: riwayatdonatur.length,
          itemBuilder: (context, index) {
            var donatur = riwayatdonatur[index];
            var tgl = donatur["tgl"];
            String tglString = "${tgl.year}-${tgl.month}-${tgl.day}";
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
                      value: donatur['pengirim'],
                    ),
                    DonaturInfoRow(
                      label: 'Email Pengirim',
                      value: donatur['email'],
                    ),
                    DonaturInfoRow(
                      label: 'Tanggal',
                      value: tglString,
                    ),
                    DonaturInfoRow(
                      label: 'Jumlah Diterima',
                      value:
                          'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(donatur['jumlah'])}',
                    ),
                    DonaturInfoRow(
                      label: 'Pesan',
                      value: donatur['pesan'],
                    ),
                    DonaturInfoRow(
                      label: 'Metode Pembayaran',
                      value: donatur['metode'],
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
