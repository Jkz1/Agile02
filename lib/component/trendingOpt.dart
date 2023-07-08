import 'package:agile02/providers/trending_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class TrendingBoxOption extends StatelessWidget {
  int idx;
  String txt;
  TrendingBoxOption({super.key, required this.idx, required this.txt});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TrendingData>(context);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
          color: prov.timeOpt[idx] ? Color(0xff30A92D) : Colors.grey,
          border: Border.all(
              color: prov.timeOpt[idx]
                  ? Color(0xff0C5513)
                  : Color.fromARGB(255, 34, 34, 34),
                  width: 1.5)),
      child: AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: 300),
        style:
            TextStyle(color: prov.timeOpt[idx] ? Colors.white : Colors.black, fontSize: 18),
        child: Text(
          txt,
        ),
      ),
    );
  }
}
