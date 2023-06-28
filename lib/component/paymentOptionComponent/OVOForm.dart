import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OVOForm extends StatefulWidget {
  OVOForm({super.key});

  @override
  State<OVOForm> createState() => _OVOFormState();
}

class _OVOFormState extends State<OVOForm> {
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: Color(0xffD9D9D9)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
              Expanded(child: Text("OVO Form", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,))
            ],
          ),
          SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
              hintText: "Your OVO Number"
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
              hintText: "Your PIN"
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Checkbox(value: _agree, onChanged: (bool? val){
                setState(() {
                  _agree = val!;
                });
              }),
              TextButton(onPressed: (){}, child: Text("Saya menyetujui syarat dan ketentuan"))
            ],
          )
        ],
      ),
    );
  }
}
