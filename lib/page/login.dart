import 'package:agile02/component/logincomp.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(child: LoginComp());
  }
}
