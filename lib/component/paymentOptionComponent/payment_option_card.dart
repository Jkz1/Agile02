import 'package:agile02/providers/payment_opt_prov.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PaymentOptionCard extends StatelessWidget {
  String text;
  bool status;
  int index;
  PaymentOptionCard({super.key, required this.text, required this.status, required this.index});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<PaymentOptProv>(context);
    return InkWell(
      onTap: (){
        prov.falseall();
        prov.setboxstatus(index);
      },
      child: Card(
        color: status? Color(0xff155E1C) : Colors.grey,
        elevation: status? 20 : 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: status? Color.fromARGB(255, 2, 48, 6) : Colors.grey.shade700, width: 0.3),
            borderRadius: BorderRadius.circular(5)
          ),
          padding: EdgeInsets.all(10),
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
            child: Text(text),
            style: TextStyle(color: status? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
