import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Text("Register"),
              ],),
              Row(children: [TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Already have an account?"),
              )],),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}
