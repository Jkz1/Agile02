import 'package:agile02/providers/payment_opt_prov.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../component/paymentOptionComponent/payment_option_card.dart';

class PaymentOptionBox extends StatefulWidget {
  const PaymentOptionBox({super.key});

  @override
  State<PaymentOptionBox> createState() => _PaymentOptionBoxState();
}

class _PaymentOptionBoxState extends State<PaymentOptionBox> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<PaymentOptProv>(context);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: Color(0xffD9D9D9)),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(6, (index) => PaymentOptionCard(text: prov.paymentOption[index], status: prov.selectedOption[index], index: index,)),
            )
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: List.generate(3,
            //           (index) => PaymentOptionCard(text: prov.paymentOption[index], status: prov.selectedOption[index], index: index,)),
            //     ),
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: List.generate(
            //           3,
            //           (index) =>
            //               PaymentOptionCard(text: prov.paymentOption[index + 3], status: prov.selectedOption[index+3], index: index+3,)),
            //     )
            //   ],
            // )
            ),
      ]),
    );
  }
}
