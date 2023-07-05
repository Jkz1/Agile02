import 'package:agile02/page/about.dart';
import 'package:agile02/page/popular.dart';
import 'package:agile02/providers/listakun.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agile02/providers/about_akun.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key});

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  " INI HALAMAN ABOUT US ",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
