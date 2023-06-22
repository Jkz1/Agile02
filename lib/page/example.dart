import 'package:agile02/component/examplecomp.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {

    List<Color> warna = [Colors.black, Colors.green, Colors.blue, Colors.red];

    return Template(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ColorBox(color: warna[index%4]);
        },
      ),
    );
  }
}