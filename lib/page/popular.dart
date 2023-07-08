import 'package:agile02/component/trendingOpt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../temp.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<bool> _selected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Trending People",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 32,
                      color: Colors.white)),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: TrendingBoxOption(
                      idx: 0,
                      txt: "Month",
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TrendingBoxOption(
                      idx: 1,
                      txt: "Year",
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TrendingBoxOption(
                      idx: 2,
                      txt: "All the time",
                    )),
                  ],
                ),
              ),
              Column(
                children: List.generate(
                    10,
                    (index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10.5),
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? Color(0xffC10404)
                                  : index == 1
                                      ? Color(0xffC15F04)
                                      : index == 2
                                          ? Color(0xff63C104)
                                          : Color(0xffAAAAAA),
                              border: Border.all(
                                width: 1.5,
                                color: index == 0
                                    ? Color(0xff490404)
                                    : index == 1
                                        ? Color(0xff633E1B)
                                        : index == 2
                                            ? Color(0xff125E1A)
                                            : Color(0xff333333),
                              )),
                          child: ListTile(
                            leading: Text(
                              "${index + 1}.",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            title: Text(
                              "Bobby B.",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            subtitle: Text(
                              "Gamers, artist",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            trailing: Column(
                              children: [
                                Text(
                                  "Rp 1jt",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "this week",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
