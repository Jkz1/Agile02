import 'package:agile02/providers/data_provider.dart';
import 'package:agile02/providers/trending_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';

class TrendingBoxOption extends StatefulWidget {
  int idx;
  String txt;
  TrendingBoxOption({super.key, required this.idx, required this.txt});

  @override
  State<TrendingBoxOption> createState() => _TrendingBoxOptionState();
}

class _TrendingBoxOptionState extends State<TrendingBoxOption> {
  @override
  void initState() {
    super.initState();
    final prov = Provider.of<TrendingData>(context, listen: false);
    final user = Provider.of<DataProvider>(context, listen: false);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      prov.changeOption(widget.idx);
      if (widget.idx == 0) {
        user.calculateAndSortByCurrentMonth();
      } else if (widget.idx == 1) {
        user.calculateAndSortByCurrentYear();
      } else if (widget.idx == 2) {
        user.calculateAndSortAllTime();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TrendingData>(context);
    final user = Provider.of<DataProvider>(context);
    return GestureDetector(
      onTap: () {
        prov.changeOption(
            widget.idx); // Memperbarui pilihan waktu pada TrendingData
        if (widget.idx == 0) {
          user.calculateAndSortByCurrentMonth();
        } else if (widget.idx == 1) {
          user.calculateAndSortByCurrentYear();
        } else if (widget.idx == 2) {
          user.calculateAndSortAllTime();
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: prov.timeOpt[widget.idx] ? Color(0xff30A92D) : Colors.grey,
          border: Border.all(
            color: prov.timeOpt[widget.idx]
                ? Color(0xff0C5513)
                : Color.fromARGB(255, 34, 34, 34),
            width: 1.5,
          ),
        ),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 300),
          style: TextStyle(
              color: prov.timeOpt[widget.idx] ? Colors.white : Colors.black,
              fontSize: 18),
          child: Text(
            widget.txt,
          ),
        ),
      ),
    );
  }
}
