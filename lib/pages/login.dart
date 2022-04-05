import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey_says/pages/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //Logo
            children: const [
              Image(
                  height: 75,
                  image: AssetImage('assets/logo/surveysays.png'))
            ],
          ),
          Container(
            height: 40,
          ),
          Row(
            children: const [
              Text(
                "Sign In",
                overflow: TextOverflow.fade,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(children: const [
            Flexible(
              child: Text(
                "Enter with your existing account below.",
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 15),
              ),
            )
          ]),
          Container(
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: "Email", hintText: "john@doe.com"),
            ),
          ),
          Container(
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: "*******",
              ),
            ),
          ),
          SizedBox(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  TextButton(
                  onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
          },
              child: const Text("Login"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.deepPurpleAccent),
            foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        ],
      ),
    ),
    // const Spacer(
    //   flex: 5,
    // ),
    Row(),
    ],
    ),
    ),
    )
    ,
    );
  }
}
