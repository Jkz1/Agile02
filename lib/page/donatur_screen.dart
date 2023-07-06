import 'package:agile02/providers/donation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonaturScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var donaturProvider = Provider.of<DonationProvider>(context);
    var donaturHistories = donaturProvider.donaturHistories;

    return Center(
      child: Container(
        width: 500,
        height: 700,
        child: ListView.builder(
          itemCount: donaturHistories.length,
          itemBuilder: (context, index) {
            var donatur = donaturHistories[index];
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              color: Color(0xFFA2A2A2),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/jokowi.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    width: 1.0,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DonaturInfoRow(
                            label: 'Nama',
                            value: donatur.name,
                          ),
                          DonaturInfoRow(
                            label: 'Tanggal',
                            value: donatur.date,
                          ),
                          DonaturInfoRow(
                            label: 'Donasi',
                            value: 'Rp ${donatur.amount.toStringAsFixed(0)}',
                          ),
                          DonaturInfoRow(
                            label: 'Pesan',
                            value: donatur.message,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
            width: 80,
            child: Text(
              '$label',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
              child: Text(
            ': $value',
            style: TextStyle(
                color: label == "Donasi" ? Color(0xff0C5513) : Colors.black),
          )),
        ],
      ),
    );
  }
}
