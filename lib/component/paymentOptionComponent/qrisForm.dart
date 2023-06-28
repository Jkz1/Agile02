import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class QrisForm extends StatefulWidget {
  QrisForm({super.key});

  @override
  State<QrisForm> createState() => _QrisFormState();
}

class _QrisFormState extends State<QrisForm> {
  bool _haspay = false;

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
              Expanded(child: Text("QRIS Shoppepay Form", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,))
            ],
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){}, child: Text("Download Qris Picture")),
          SizedBox(height: 10,),
          TextField(
            enabled: !_haspay,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
              hintText: "Your Shoppepay Number"
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            enabled: !_haspay,
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
              Checkbox(value: _haspay, onChanged: (bool? val){
                setState(() {
                  _haspay = val!;
                });
              }),
              Text("Saya sudah membayar melalui Qris")
            ],
          )
        ],
      ),
    );
  }
}
