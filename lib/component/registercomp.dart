import 'package:agile02/home.dart';
import 'package:agile02/page/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:intl/intl.dart';

import '../providers/provUtama.dart';

class RegisterComp extends StatefulWidget {
  final TextEditingController usernameInputRegister;

  const RegisterComp({Key? key, required this.usernameInputRegister})
      : super(key: key);

  @override
  _RegisterCompState createState() => _RegisterCompState();
}

class _RegisterCompState extends State<RegisterComp> {
  final TextEditingController _tglLahirController = TextEditingController();

  late String tgl_lahir;

  DateTime? tglLahir;

  TextEditingController username = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController konfirmasipassword = TextEditingController();

  bool passwordStatus = false;
  bool usernameStatus = false;

  @override
  void dispose() {
    _tglLahirController.dispose();
    username.dispose();
    nama.dispose();
    email.dispose();
    password.dispose();
    konfirmasipassword.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.usernameInputRegister.text.isNotEmpty) {
      username.text = widget.usernameInputRegister.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameInputRegister =
        widget.usernameInputRegister;
    final registerProvider = Provider.of<DataProvider>(context);
    final mainprov = Provider.of<ProvUtama>(context);

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70),
              const Text(
                "Register",
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
                        "Username",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: username,
                        decoration: InputDecoration(
                          errorText:
                              usernameStatus ? "Username tidak tersedia" : null,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      const Text(
                        "Nama",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: nama,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      const Text(
                        "Email aktif",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      const Text(
                        "Tanggal Lahir",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        controller: _tglLahirController,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              tglLahir = selectedDate;
                              tgl_lahir =
                                  DateFormat('yyyy-MM-dd').format(selectedDate);
                              _tglLahirController.text = tgl_lahir;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      const Text(
                        "Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText:
                              passwordStatus ? "Password tidak sama " : null,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      const Text(
                        "Ketik Ulang Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: konfirmasipassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText:
                              passwordStatus ? "Password tidak sama" : null,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Dengan melanjutkan, berarti kamu telah menyetujui syarat dan ketentuan & kebijakan privasi ",
                                  ),
                                  TextSpan(
                                    text: "Bagibagi.id",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (password.text != konfirmasipassword.text) {
                              setState(() {
                                passwordStatus = true;
                              });
                            }
                            if (username.text.length < 5) {
                              setState(() {
                                usernameStatus = true;
                              });
                            }
                            // setState(() {});
                            if (password.text == konfirmasipassword.text && username.text.length >= 5) {
                              // "username": "JokotiHD",
                              // "nama": "Joko",
                              // "email": "asd",
                              // "tanggal_lahir": DateTime(2003, 3, 14),
                              // "password": "asd",
                              // "totalPendapatan" : 0,
                              // "danaSekarang" : 0,
                              mainprov.addakun(
                                  username.text,
                                  nama.text,
                                  email.text,
                                  tglLahir!,
                                  password.text);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(milliseconds: 800),
                                content: Text("Berhasil menambahkan akun"),
                              ));
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Kesalahan pengisian"),
                                duration: Duration(milliseconds: 600),
                              ));
                            }
                            // Kembali ke halaman login setelah registrasi berhasil
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: Text('REGISTER'),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Sudah punya akun? "),
                          InkWell(
                            child: Text(
                              "Login disini",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
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
}
