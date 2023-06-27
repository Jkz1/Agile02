import 'package:agile02/component/paymentOptionComponent/Qrisform.dart';
import 'package:agile02/page/example.dart';
import 'package:agile02/page/payment_option_box.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Masukkan semua page yng dibuat kemari
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Example()));
                },
                child: Text("Contoh")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => PaymentOptionBox()));
                },
                child: Text("PaymentOptionBox"))
          ],
        ),
      ),
    );
  }
}
