import 'package:agile02/MainHome.dart';
import 'package:agile02/page/payment_option_box.dart';
import 'package:agile02/providers/pageProv.dart';
import 'package:agile02/providers/provUtama.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:agile02/providers/payment_opt_prov.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  final String usernamePenerima;

  const Payment({super.key, required this.usernamePenerima});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool? _isChecked = false;

  TextEditingController nominal_pengirim = TextEditingController();
  TextEditingController nama_pengirim = TextEditingController();

  TextEditingController email_pengirim = TextEditingController();
  TextEditingController pesan_pengirim = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mainProv = Provider.of<ProvUtama>(context);
    final paymentOpt = Provider.of<PaymentOptProv>(context);
    final pageprov = Provider.of<PageProv>(context);
    String? usernamePenerima = widget.usernamePenerima;

    var user;

    for (var i in mainProv.daftarakun){
      if(i["username"] == usernamePenerima){
        user = i;
      }
    }

    final String nama = user['nama'] ?? '';
    final String imgProfil = user['img'] ?? '';
    return Template(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(imgProfil),
                    ),
                    Text(
                      nama,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 680,
                      width: 500,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nominal_pengirim,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade400,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  labelText: 'Nominal (Rp.)',
                                  hintText: 'Minimal Donasi 10.000',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: nama_pengirim,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade400,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  labelText: 'Nama Donatur',
                                  hintText: 'Berikan Nama Pengenal',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: email_pengirim,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade400,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  labelText: 'Email',
                                  hintText: 'Masukkan Email untuk Konfirmasi',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: pesan_pengirim,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade400,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  labelText: 'Pesan',
                                  hintText: 'Berikan Pesan Terbaikmu!',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: _isChecked,
                                    activeColor: Colors.green.shade900,
                                    onChanged: (newBool) {
                                      setState(() {
                                        _isChecked = newBool;
                                      });
                                    }),
                                Expanded(
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'Saya setuju bahwa dukungan ini diberikan secara sukarela dan bukan sebagai imbalan atas kegiatan komersial sesuai dengan '),
                                    TextSpan(
                                        text:
                                            'Syarat dan Ketentuan BagiBagi.id',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blueAccent.shade700))
                                  ])),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            PaymentOptionBox(),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                mainProv.donate(
                                    usernamePenerima,
                                    mainProv.islogin["username"],
                                    nominal_pengirim.text,
                                    nama_pengirim.text,
                                    email_pengirim.text,
                                    pesan_pengirim.text,
                                    paymentOpt.getSelectedPaymentOption());

                                // Membuat showDialog dengan detail donasi
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Detail Donasi',
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16.0),
                                            // const Text("Donasi Anda berhasil"),
                                            // SizedBox(height: 10.0),
                                            Text(
                                              'Penerima: $usernamePenerima',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'Nominal: ${nominal_pengirim.text}',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'Metode Pembayaran: ${paymentOpt.getSelectedPaymentOption()}',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(height: 16.0),
                                            Align(
                                              alignment: Alignment.center,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    pageprov.setselectedPage =
                                                        0;
                                                  });
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          UtamaHome(),
                                                    ),
                                                  );
                                                },
                                                child: Text('OK'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.attach_money_sharp),
                              label: Text('KIRIM'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green.shade600),
                                minimumSize:
                                    MaterialStateProperty.all(Size(150, 50)),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 16)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
