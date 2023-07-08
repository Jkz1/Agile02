import 'package:agile02/MainHome.dart';
import 'package:agile02/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agile02/page/register.dart';
import 'package:agile02/providers/data_provider.dart';

import '../providers/provUtama.dart';

class LoginComp extends StatelessWidget {
  const LoginComp({Key? key}) : super(key: key);

  get usernameInputRegister => null;

  @override
  Widget build(BuildContext context) {
    final mainprov = Provider.of<ProvUtama>(context);

    var passwordController = TextEditingController();
    var emailController = TextEditingController();

    String email = '';
    String password = '';

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70),
              const Text(
                "Login",
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
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: emailController,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      const Text(
                        "Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Panggil method login dengan menggunakan callback navigateToHome
                                // loginProvider.login(
                                //     email, password, navigateToHome, (error) {
                                //   // Tampilkan notifikasi jika login gagal
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content: Text(error),
                                //     ),
                                //   );
                                // });
                                emailController.text = "";
                                passwordController.text = "";
                                mainprov.login(email, password,
                                    (String username){
                                  // Tandai bahwa login berhasil
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Selamat datang di bagibagi.id"),
                                  ));
                                  // Tampilkan halaman Home dan hapus stack halaman sebelumnya
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UtamaHome()),
                                  );
                                }, (error) {
                                  // Tampilkan notifikasi jika login gagal
                                  print(error);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(error),
                                    ),
                                  );
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              child: Text('LOGIN'),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Belum punya akun? "),
                                InkWell(
                                  child: Text(
                                    "Daftar disini",
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
                                        builder: (context) => Register(
                                            usernameInputRegister:
                                                usernameInputRegister ??
                                                    TextEditingController()),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
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
