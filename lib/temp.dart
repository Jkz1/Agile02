import 'package:agile02/MainHome.dart';
import 'package:agile02/home.dart';
import 'package:agile02/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:provider/provider.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:agile02/providers/pageProv.dart';

class Template extends StatefulWidget {
  Widget child;
  Template({super.key, required this.child});

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DataProvider>(context);
    final pageprov = Provider.of<PageProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/title.png'),
        actions: [
          if (user.isLoggedIn)
            PopupMenuButton<String>(
              onSelected: (String value) {
                if (!user.isLoggedIn) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Informasi"),
                        content: const Text("Maaf, Anda harus masuk ke Akun"),
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
                } else {
                  // Aksi yang diambil saat menu dipilih
                  if (value == 'home') {
                    setState(() {
                      pageprov.setselectedPage = 0;
                    });
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UtamaHome()));
                  } else if (value == "search") {
                    setState(() {
                      pageprov.setselectedPage = 1;
                    });
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UtamaHome()));
                  } else if (value == "logout") {
                    setState(() {
                      user.setLoggedIn = false;
                      user.setUserLogin = "";
                      pageprov.setselectedPage = 0;
                    });
                    Navigator.of(context).pop();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainHome()),
                      (route) => false,
                    );
                  }
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'home',
                  child: Text('Informasi Akun'),
                ),
                const PopupMenuItem<String>(
                  value: 'search',
                  child: Text('Cari Creator'),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ],
            ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/footer.png'),
          ),
          widget.child
        ],
      ),
    );
  }
}
