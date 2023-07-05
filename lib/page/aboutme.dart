import 'package:agile02/page/donation_screen.dart';
import 'package:agile02/page/donatur_screen.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../component/aboutmeComp.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  void _showShareBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                title: const Text(
                  "Share ke Media Sosial",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
                tileColor: Colors.green,
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close)),
              ),
              ListTile(
                // leading: Icon(Icons.share),
                title: Text('WhatsApp'),
                onTap: () {
                  // Implement sharing to WhatsApp
                  Navigator.pop(context);
                  _showSnackbar('Berhasil share ke WhatsApp');
                },
              ),
              ListTile(
                // leading: Icon(Icons.share),
                title: Text('Instagram'),
                onTap: () {
                  // Implement sharing to Instagram
                  Navigator.pop(context);
                  _showSnackbar('Berhasil share ke Instagram');
                },
              ),
              ListTile(
                // leading: Icon(Icons.share),
                title: Text('Facebook'),
                onTap: () {
                  // Implement sharing to Facebook
                  Navigator.pop(context);
                  _showSnackbar('Berhasil share ke Facebook');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Informasi Saya",
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xff0C5513))),
                child: Column(children: [
                  Row(
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
                      Data(),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Bagikan Link Saya :  "),
                      Text(
                        "bagibagi.id/jokowii",
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          _showShareBottomSheet();
                        },
                        child: Icon(
                          Icons.share,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DonationScreen(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffD9D9D9)),
                    child: Column(
                      children: [
                        Text(
                          "Riwayat Dukungan",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Table(
                        //   columnWidths: {
                        //     0: FractionColumnWidth(0.25),
                        //     1: FractionColumnWidth(0.75),
                        //   },
                        //   children: [],
                        // )
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
