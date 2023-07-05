import 'package:agile02/component/registercomp.dart';
import 'package:agile02/temp.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final TextEditingController usernameInputRegister;

  const Register({Key? key, required this.usernameInputRegister})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Template(
        child: RegisterComp(usernameInputRegister: usernameInputRegister));
  }
}
