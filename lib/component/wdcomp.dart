import 'package:agile02/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/wd_provider.dart';

import 'package:intl/intl.dart';

class WDComp extends StatefulWidget {
  const WDComp({Key? key}) : super(key: key);

  @override
  State<WDComp> createState() => _WDCompState();
}

class _WDCompState extends State<WDComp> {
  String? metodePenarikan;
  String? jumlahWD;

  Map<String, dynamic> accUser = {
    "username": 'user1',
    "acc_bank_id": "AB1",
    "sisa_saldo": "12000000"
  };

  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final wdProvider = Provider.of<WDProvider>(context);

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70),
              const Text(
                "Penarikan Dana",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Transfer saldo dari BBPay ke",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 4, color: Colors.green),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("BANK CENTRAL ASIA".toUpperCase()),
                                  const Text(" - "),
                                  const Text("1234567890")
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text("JOKO CH".toUpperCase()),
                                  SizedBox(width: 50),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Informasi"),
                                            content: const Text(
                                                "Maaf, saat ini Ubah Rekening Tujuan dalam perbaikan."),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("OK"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      "Ubah Tujuan Penarikan",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      const Text(
                        "Metode Penarikan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: const Text("Antrian"),
                            leading: Radio(
                                value: "antian",
                                groupValue: metodePenarikan,
                                onChanged: (value) {
                                  setState(() {
                                    metodePenarikan = value;
                                  });
                                }),
                          )),
                          Expanded(
                              child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Row(
                              children: [
                                const Text("Instan"),
                                const SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                  ),
                                  child: const Text(
                                    "Proses Cepat",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            leading: Radio(
                                value: "instan",
                                groupValue: metodePenarikan,
                                onChanged: (value) {
                                  setState(() {
                                    metodePenarikan = value;
                                  });
                                }),
                          ))
                        ],
                      ),
                      SizedBox(height: 16),
                      const Text(
                        "Saldo kamu",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Rp. ${NumberFormat('#,##0').format(int.parse(accUser['sisa_saldo']))}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                jumlahWD = accUser['sisa_saldo'].toString();
                                textFieldController.text =
                                    '${accUser['sisa_saldo']}';
                              });
                            },
                            child: const Text(
                              "Tarik seluruhnya",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      const Text(
                        "Jumlah Penarikan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      const Text(
                        "Minimal: Rp. 10,000 | Maksimal Rp. 100,000,000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: textFieldController,
                        onChanged: (value) {
                          jumlahWD = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              wdProvider.tarikSaldo(
                                  'user1', 'AB1', metodePenarikan!, jumlahWD!);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: Text('Tarik Saldo'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCurrency(int amount) {
    final formatter = NumberFormat("#,###", "id_ID");
    return 'Rp. ${formatter.format(amount)}';
  }
}
