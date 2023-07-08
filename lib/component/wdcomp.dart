import 'package:agile02/home.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:agile02/providers/provUtama.dart';
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
    final user = Provider.of<ProvUtama>(context);
    var userLogin = user.islogin;
    String sisaSaldo = userLogin["danaSekarang"].toString();

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "Penarikan Dana",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Transfer saldo dari BBPay ke",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          decoration: const BoxDecoration(
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
                                        decoration: const InputDecoration(
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
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Nomor Rekening"),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: an,
                                        onChanged: (value) {
                                          aN = value;
                                        },
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Nama Penerima"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Metode Penarikan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: "antrian",
                                    groupValue: metodePenarikan,
                                    onChanged: (value) {
                                      setState(() {
                                        metodePenarikan = value!;
                                      });
                                    }),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("Antrian"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: "instan",
                                    groupValue: metodePenarikan,
                                    onChanged: (value) {
                                      setState(() {
                                        metodePenarikan = value!;
                                      });
                                    }),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("Instan"),
                                const SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                  ),
                                  child: const Text(
                                    "Proses Cepat",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Saldo kamu",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Rp. ${NumberFormat('#,##0').format(int.parse(sisaSaldo))}",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
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
                        const SizedBox(height: 16),
                        const Text(
                          "Jumlah Penarikan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Minimal: Rp. 10,000 | Maksimal Rp.${NumberFormat('#,##0').format(int.parse(sisaSaldo))}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: jumlahwd,
                          onChanged: (value) {
                            jumlahWD = value;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (metodePenarikan != null && jumlahwd.text != "" && jumlahwd.text != "0" && int.parse(jumlahwd.text) <= userLogin["danaSekarang"] && norek.text != "" && namabank.text != "" && an.text != "") {
                                  print("Ter isi semua");
                                  // user.tarikSaldo(
                                  //     user.userLogin,
                                  //     metodePenarikan!,
                                  //     jumlahWD!,
                                  //     namaBank!,
                                  //     noRek!,
                                  //     aN!);
                                  // metodePenarikan = null;
                                  // jumlahwd.clear();
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Kesalahan pengisian"),
                                    duration: Duration(milliseconds: 600),
                                  ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              child: const Text('Tarik Saldo'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("List Penarikan Dana"),
                        const SizedBox(height: 10),
                        Center(
                          child: Table(
                            columnWidths: const {
                              // 0: FractionColumnWidth(0.2),
                              0: FractionColumnWidth(0.25),
                              1: FractionColumnWidth(0.25),
                              2: FractionColumnWidth(0.25),
                              3: FractionColumnWidth(0.25),
                            },
                            border: TableBorder.all(color: Colors.grey),
                            children: [
                              const TableRow(
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
                              for (var wd in userLogin["penarikan"]) TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                            '${wd['namaBank'] ?? '-'} - ${wd['noRek'] ?? ''}'),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child:
                                            Text(wd['metode'] ?? ''),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(wd["jumlah"].toString()),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(wd["status"]),
                                      ),
                                    ),
                                  ],
                                )
                                
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
