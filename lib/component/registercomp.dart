import 'package:agile02/home.dart';
import 'package:agile02/page/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/auth_provider.dart';
import 'package:intl/intl.dart';

class RegisterComp extends StatefulWidget {
  const RegisterComp({Key? key}) : super(key: key);

  @override
  _RegisterCompState createState() => _RegisterCompState();
}

class _RegisterCompState extends State<RegisterComp> {
  final TextEditingController _tglLahirController = TextEditingController();
  late String tgl_lahir;

  @override
  void dispose() {
    _tglLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<DataProvider>(context);

    String username = '';
    String nama = '';
    String email = '';
    String password = '';
    String konfirmasipassword = '';

    void navigateToHome() {
      // Tandai bahwa register berhasil
      registerProvider.register(username, nama, email, tgl_lahir, password, () {
        // Tampilkan halaman Home dan hapus stack halaman sebelumnya
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Home()),
          (route) => false,
        );
      }, (error) {
        // Tampilkan notifikasi jika register gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error),
          ),
        );
      });
    }

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
                        onChanged: (value) {
                          username = value;
                        },
                        decoration: InputDecoration(
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
                        onChanged: (value) {
                          nama = value;
                        },
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
                        onChanged: (value) {
                          email = value;
                        },
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
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
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
                        onChanged: (value) {
                          konfirmasipassword = value;
                        },
                        decoration: InputDecoration(
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
                            // Panggil method register dari registerProvider
                            registerProvider.register(username, nama, email,
                                tgl_lahir, password, navigateToHome, (error) {
                              // Tampilkan notifikasi jika login gagal
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(error),
                                ),
                              );
                            });

                            // Kembali ke halaman login setelah registrasi berhasil
                            Navigator.pop(context);
                          },
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
