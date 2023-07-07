import 'package:agile02/home.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/data_provider.dart';

import 'package:intl/intl.dart';

class WDComp extends StatefulWidget {
  const WDComp({Key? key}) : super(key: key);

  @override
  State<WDComp> createState() => _WDCompState();
}

class _WDCompState extends State<WDComp> {
  String? metodePenarikan;
  String? namaBank;
  String? noRek;
  String? aN;
  String? jumlahWD;

  TextEditingController jumlahwd = TextEditingController();
  TextEditingController namabank = TextEditingController();
  TextEditingController norek = TextEditingController();
  TextEditingController an = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DataProvider>(context);
    String? userLogin = user.userLogin;
    String sisaSaldo = user.sumSaldo(user.userLogin).toString();

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
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
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
                                    Expanded(
                                      child: TextField(
                                        controller: namabank,
                                        onChanged: (value) {
                                          namaBank = value;
                                        },
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Nama Bank"),
                                      ),
                                    ),
                                    const Text(" - "),
                                    Expanded(
                                      child: TextField(
                                        controller: norek,
                                        onChanged: (value) {
                                          noRek = value;
                                        },
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Nomor Rekening"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: an,
                                        onChanged: (value) {
                                          aN = value;
                                        },
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Nama Penerima"),
                                      ),
                                    ),
                                    // SizedBox(width: 50),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     showDialog(
                                    //       context: context,
                                    //       builder: (BuildContext context) {
                                    //         return AlertDialog(
                                    //           title: const Text("Informasi"),
                                    //           content: const Text(
                                    //               "Maaf, saat ini Ubah Rekening Tujuan dalam perbaikan."),
                                    //           actions: [
                                    //             TextButton(
                                    //               onPressed: () {
                                    //                 Navigator.of(context).pop();
                                    //               },
                                    //               child: const Text("OK"),
                                    //             ),
                                    //           ],
                                    //         );
                                    //       },
                                    //     );
                                    //   },
                                    //   child: Text(
                                    //     "Ubah Tujuan Penarikan",
                                    //     style: TextStyle(color: Colors.red),
                                    //   ),
                                    // ),
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
                                  value: "antrian",
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
                              "Rp. ${NumberFormat('#,##0').format(int.parse(sisaSaldo))}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  jumlahWD = sisaSaldo.toString();
                                  jumlahwd.text = '$sisaSaldo';
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
                          controller: jumlahwd,
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
                                if (metodePenarikan != null &&
                                    jumlahWD != null) {
                                  user.tarikSaldo(
                                      user.userLogin,
                                      metodePenarikan!,
                                      jumlahWD!,
                                      namaBank!,
                                      noRek!,
                                      aN!);
                                  metodePenarikan = null;
                                  jumlahwd.clear();
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Kesalahan pengisian"),
                                    duration: Duration(milliseconds: 600),
                                  ));
                                }
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
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("List Penarikan Dana"),
                        SizedBox(height: 10),
                        Center(
                          child: Table(
                            columnWidths: {
                              // 0: FractionColumnWidth(0.2),
                              0: FractionColumnWidth(0.2),
                              1: FractionColumnWidth(0.2),
                              2: FractionColumnWidth(0.2),
                              3: FractionColumnWidth(0.2),
                            },
                            border: TableBorder.all(color: Colors.grey),
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Acc Bank ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Metode Penarikan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Jumlah Penarikan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Status Penarikan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...user.users
                                  .where(
                                      (user) => user['username'] == userLogin)
                                  .expand(
                                      (user) => user['penarikan_dana'] ?? [])
                                  .map((wd) {
                                String jumlahPenarikan =
                                    'Rp. ${wd['jumlah_penarikan'] ?? ''}';
                                String statusPenarikan = '';
                                if (wd['status_penarikan'] == '0') {
                                  statusPenarikan = 'Proses';
                                } else if (wd['status_penarikan'] == '1') {
                                  statusPenarikan = 'Sukses';
                                }
                                return TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                            '${wd['nama_bank'] ?? '-'} - ${wd['norek'] ?? ''}'),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child:
                                            Text(wd['metode_penarikan'] ?? ''),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(jumlahPenarikan),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(statusPenarikan),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
