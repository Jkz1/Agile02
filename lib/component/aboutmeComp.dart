import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:provider/provider.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  tableRowCostum(Widget leading, String text) {
    return TableRow(children: [
      Padding(padding: EdgeInsets.all(8), child: leading),
      Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              text,
              style: TextStyle(fontSize: 15),
              overflow: TextOverflow.fade,
            )),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var users = Provider.of<DataProvider>(context);
    var userLogin =
        users.users.firstWhere((user) => user['username'] == users.userLogin);
    return Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 67,
              backgroundColor: Color(0xff0C5513),
              child: CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('assets/jokowi.jpg'),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "edit foto",
                  style: TextStyle(color: Colors.red),
                ))
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                color: const Color(0xffD9D9D9),
                child: Table(
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xff0C5513),
                  ),
                  columnWidths: {
                    0: FractionColumnWidth(0.25),
                    1: FractionColumnWidth(0.75),
                  },
                  children: [
                    tableRowCostum(Icon(Icons.people, color: Color(0xff0C5513)),
                        userLogin['nama']),
                    tableRowCostum(Icon(Icons.link, color: Color(0xff0C5513)),
                        userLogin['username']),
                    tableRowCostum(Icon(Icons.email, color: Color(0xff0C5513)),
                        userLogin['email']),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "edit foto",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
