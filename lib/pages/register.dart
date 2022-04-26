import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../helpers/loginsql.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final LoginSQLHelper loginHelper = LoginSQLHelper.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Row(children: [
                        Image.asset("assets/logo/surveysays_black.png", height: 80)
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
                                    child: TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text("Sign In",
                                          style: TextStyle(
                                              fontFamily: "Lexend Deca",
                                              color: Color(0xFF95A1AC),
                                              fontSize: 28,
                                              fontWeight: FontWeight.w700)),
                                      style: ButtonStyle(
                                        alignment: Alignment.centerLeft, // <-- had to set alignment
                                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                          const EdgeInsets.all(0.0), // <-- had to set padding to 0
                                        ),
                                      ),
                                    )),
                                Container(
                                  width: 140,
                                  height: 50,
                                  child: TextButton(
                                    onPressed: null,
                                    child: const Text("Sign Up",
                                        style: TextStyle(
                                            fontFamily: "Lexend Deca",
                                            color: Colors.black,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500)),
                                    style: ButtonStyle(
                                      alignment: Alignment.centerLeft, // <-- had to set alignment
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        const EdgeInsets.all(0.0), // <-- had to set padding to 0
                                      ),
                                    ),

                                  ),
                                )
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
                            controller: emailController,
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
                            controller: passwordController,
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
                        children: [
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: TextButton(
                              onPressed: () async {
                                User user = User(
                                    email: emailController.text,
                                    password: passwordController.text);
                                if (await loginHelper.hasUser(user)) {
                                  print("Email address already registered");
                                  _showMyDialog(
                                      context, "Email address already registered");
                                } else {
                                  loginHelper.addUser(user);
                                  print("Registered");
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text("Register"),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    )),
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
        )
      )
    );
  }
}

Future<void> _showMyDialog(BuildContext context, String text) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Register Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('$text'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
