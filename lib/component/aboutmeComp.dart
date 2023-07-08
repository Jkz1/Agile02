import 'package:agile02/providers/provUtama.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:agile02/providers/data_provider.dart';
import 'package:provider/provider.dart';

class Data extends StatelessWidget {
  String email;
  String username;
  String nama;
  Data({super.key, required this.email, required this.username, required this.nama});

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
    var users = Provider.of<ProvUtama>(context);
    var userLogin = users.islogin;
    return Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 67,
              backgroundColor: Color(0xff0C5513),
              child: CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage(userLogin['img'] ?? ''),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Informasi"),
                        content: const Text(
                            "Maaf, saat ini Ubah Foto dalam pengembangan."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "edit foto",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            )
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
                        nama),
                    tableRowCostum(Icon(Icons.link, color: Color(0xff0C5513)),
                        username),
                    tableRowCostum(Icon(Icons.email, color: Color(0xff0C5513)),
                        email),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Informasi"),
                          content: const Text(
                              "Maaf, saat ini Ubah Data dalam pengembangan."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "edit data",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
