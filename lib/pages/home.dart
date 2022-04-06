import 'package:flutter/material.dart';
import 'package:survey_says/pages/login2.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) => Login2()));
          },
          child: Text("Logout"),
        ));
  }
}
