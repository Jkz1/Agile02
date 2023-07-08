import 'package:agile02/page/wd.dart';
import 'package:agile02/providers/provUtama.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/donation_model.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DonationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provUtama = Provider.of<ProvUtama>(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Color(0xFF92F090),
          border: Border.all(color: Color(0xff0C5513), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<DonationModel>(
              builder: (context, donation, child) {
                return Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Total Pendapatan',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Dana Sekarang',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(provUtama.islogin["totalPendapatan"])}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(provUtama.islogin["danaSekarang"])}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: provUtama.islogin["danaSekarang"] != 0
              ?() {
                // Handle penarikan dana
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WD(),
                  ),
                );
              } : null,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF30A92D),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/Group3.png'),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Penarikan Dana',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
