import 'package:agile02/home.dart';
import 'package:agile02/page/about.dart';
import 'package:agile02/page/aboutme.dart';
import 'package:agile02/page/aboutus.dart';
import 'package:agile02/page/listcreator.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:agile02/providers/pageProv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class UtamaHome extends StatefulWidget {
  const UtamaHome({super.key});

  @override
  State<UtamaHome> createState() => _UtamaHomeState();
}

class _UtamaHomeState extends State<UtamaHome> {
  @override
  Widget build(BuildContext context) {
    final pageprov = Provider.of<pageProv>(context);
    final user = Provider.of<DataProvider>(context);
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
                      MaterialPageRoute(builder: (context) => Home()),
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Color(0xff9ED447),
        currentIndex: pageprov.selectedPage,
        onTap: (value) {
          setState(() {
            pageprov.setselectedPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label: "About Us", icon: Icon(Icons.question_mark)),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/footer.png'),
          ),
          pageprov.selectedPage == 0
              ? AboutMe()
              : pageprov.selectedPage == 1
                  ? Listacc()
                  : pageprov.selectedPage == 2
                      ? AboutUs()
                      : Container()
        ],
      ),
    );
    ;
  }
}
