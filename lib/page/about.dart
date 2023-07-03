import 'package:agile02/temp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';

//Jika terdapat error, ikuti langkah yang kubuat di readme.md

class About extends StatelessWidget {
  Map<String, dynamic> data;
  About({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    openUrl(String urltujuan) async {
      Uri _urlUri = Uri.parse(urltujuan);
      if (kIsWeb) {
        html.window.open(urltujuan, "Youtube");
      } else if (Platform.isAndroid) {
        if (await canLaunchUrl(_urlUri)) {
          launchUrl(_urlUri, mode: LaunchMode.externalApplication);
        }
      } else {
        print("Platform not supported");
      }
    }

    String job = "";
    for (int i = 0; i < data["job"].length; i++) {
      job += data["job"][i];
    }
    print(job);
    return Template(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff0C5513),
                  radius: 63,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(data["img"]),
                    radius: 60,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  data["name"],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "@${data["username"]}",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  job,
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Image.asset("assets/youtube.png")),
                    TextButton(
                        onPressed: () {},
                        child: Image.asset("assets/twitch.png")),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xff0C5513))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning,
                            color: Color(0xff0C5513),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "About me!",
                            style: TextStyle(
                                color: Color(0xff0C5513), fontSize: 23),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(data["desc"])
                    ],
                  ),
                ),
                SizedBox(height: 13,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xff0C5513))),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff22A62F)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)))),
                        onPressed: () {},
                        child: Text("Support Aku Disini!"),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "atau",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0xff92F090),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff0C5513), width: 1.5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.people,
                        color: Color(0xff0C5513),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "Follow Aku",
                        style: TextStyle(color: Color(0xff0C5513), fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
