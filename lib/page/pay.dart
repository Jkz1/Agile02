import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
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
                      backgroundImage: AssetImage("assets/jokowi.jpg"),
                    ),
                    Text(
                      "Joko CH.",
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
                            Container(
                              width: 500,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  )),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Qris - ShopeePay'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green.shade900),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(170, 90)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text('OVO'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green.shade900),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(105, 90)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Kartu Kredit'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green.shade900),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(165, 90)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Debit / MBanking'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green.shade900),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(170, 90)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Dana'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green.shade900),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(105, 90)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text('PayPal'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green.shade900),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(165, 90)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
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
