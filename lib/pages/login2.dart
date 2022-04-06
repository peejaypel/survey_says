import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Login2 extends StatelessWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Row(children: [
                    Image.asset("assets/logo/surveysays.png", height: 50)
                  ]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: 140,
                                height: 50,
                                child: const Text("Sign In",
                                    style: TextStyle(
                                        fontFamily: "Lexend Deca",
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700))),
                            Container(
                                width: 140,
                                height: 50,
                                child: const Text("Sign Up",
                                    style: TextStyle(
                                        fontFamily: "Lexend Deca",
                                        color: Color(0xFF95A1AC),
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500)))
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: Row(children: const [
                      Text("Get started by creating an account below",
                          style: TextStyle(
                              fontFamily: "Lexend Deca",
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.w400))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                    child: Container(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7), width: 0.0),
                            ),
                            border: OutlineInputBorder(),
                            labelText: "Your email address...",
                            hintText: "Enter your email..."),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                    child: Container(
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: BorderSide(
                                color: Color(0xFFDBE2E7), width: 0.0),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          hintText: "Enter your password...",
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[ SizedBox(
                      width: 150,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Home()));
                        },
                        child: const Text("Login"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF090F13)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                    ),
                    ],
                  ),
                ]),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
