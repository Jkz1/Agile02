import 'package:agile02/component/paymentOptionComponent/OVOForm.dart';
import 'package:agile02/component/paymentOptionComponent/qrisForm.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../component/paymentOptionComponent/payment_option_card.dart';

class PaymentOptionBox extends StatefulWidget {
  const PaymentOptionBox({super.key});

  @override
  State<PaymentOptionBox> createState() => _PaymentOptionBoxState();
}

class _PaymentOptionBoxState extends State<PaymentOptionBox> {
  List<String> PaymentOption = [
    "QRIS - ShoppePay",
    "OVO",
    "Kartu Kredit",
    "Debit / Mbanking",
    "Dana",
    "PayPal",
  ];
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
        OVOForm(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: Color(0xffD9D9D9)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3,
                      (index) => PaymentOptionCard(text: PaymentOption[index])),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      3,
                      (index) =>
                          PaymentOptionCard(text: PaymentOption[index + 3])),
                )
              ],
            )),
      ]),
    );
  }
}
