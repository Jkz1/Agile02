import 'package:agile02/component/paymentOptionComponent/Qrisform.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PaymentOptionCard extends StatelessWidget {
  String text;
  PaymentOptionCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => QrisForm()));
      },
      child: Card(
        color: Color(0xff155E1C),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
