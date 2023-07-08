import 'package:agile02/component/trendingOpt.dart';
import 'package:agile02/page/about.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:agile02/providers/trending_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<bool> _selected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DataProvider>(context);
    final prov = Provider.of<TrendingData>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Trending People",
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
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
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TrendingBoxOption(
                        idx: 1,
                        txt: "Year",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TrendingBoxOption(
                        idx: 2,
                        txt: "All the time",
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(
                  user.trendingUsers.length,
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
                      ),
                    ),
                    child: ListTile(
                      leading: Text(
                        "${index + 1}.",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      title: Text(
                        user.trendingUsers[index]['username'],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      subtitle: Text(
                        user.trendingUsers[index]['job'].join(""),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            "Rp ${NumberFormat('#,##0').format(user.trendingUsers[index]['total_diterima'])}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            prov.timeOpt[prov.selectedOptionIndex]
                                ? "this month"
                                : prov.timeOpt[1]
                                    ? "this year"
                                    : "all time",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => About(
                                username: user.trendingUsers[index]
                                    ['username']),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
