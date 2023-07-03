import 'package:agile02/page/about.dart';
import 'package:agile02/page/donation_screen.dart';
import 'package:agile02/page/example.dart';
import 'package:agile02/page/listcreator.dart';
import 'package:agile02/page/login.dart';
import 'package:agile02/page/pay.dart';
import 'package:agile02/page/register.dart';
import 'package:agile02/page/wd.dart';
import 'package:agile02/page/payment_option_box.dart';
import 'package:agile02/providers/about_akun.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'page/donatur_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final aboutprov = Provider.of<AboutAkun>(context);
    return Template(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Masukkan semua page yng dibuat kemari

            // Daftar
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Register()));
              },
              child: Text("Daftar"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Login
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // Penarikan dana
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => WD()));
              },
              child: Text("Penarikan Dana"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // Button Contoh

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Template(
                                child: PaymentOptionBox(),
                              )));
                },
                child: Text("PaymentOptionBox")),

            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DonationScreen()));
                },
                child: Text("Total Saldo")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Payment()));
                },
                child: Text("Pay")),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DonaturScreen()));
                },
                child: Text("Donatur")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Listacc()));
                },
                child: Text("Search")),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (_) => About(data: aboutprov.data[0],)));
            //     },
            //     child: Text("About")),
          ],
        ),
      ),
    );
  }
}
