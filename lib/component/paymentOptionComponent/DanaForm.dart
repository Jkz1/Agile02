import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DanaForm extends StatefulWidget {
  DanaForm({super.key});

  @override
  State<DanaForm> createState() => _DanaFormState();
}

class _DanaFormState extends State<DanaForm> {
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
              Expanded(child: Text("Dana Form", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,))
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
              hintText: "Your Dana Number"
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
