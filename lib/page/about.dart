import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class About extends StatelessWidget {
  Map<String, dynamic> data;
  About({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String job = "";
    for (int i = 0; i < data["job"].length; i++){
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
                SizedBox(height: 4,),
                Text(data["name"], style: TextStyle(color: Colors.white, fontSize: 20),),
                Text("@${data["username"]}", style: TextStyle(color: Colors.white),),
                SizedBox(height: 7,),
                Text(
                  job,
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration : BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff0C5513))
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.warning, color: Color(0xff0C5513),),
                          SizedBox(width: 3,),
                          Text("About me!", style: TextStyle(color: Color(0xff0C5513), fontSize: 23),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(data["desc"])
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration : BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff0C5513))
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff22A62F))),
                        onPressed: (){},
                        child: Text("Support Aku Disini!"),
                      ))
                    ],
                  ),
                ),
                Text("atau", style: TextStyle(color: Colors.white),),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xff92F090),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff0C5513))

                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.people, color: Color(0xff0C5513),),
                      Text("Follow Aku", style: TextStyle(color: Color(0xff0C5513)),)
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