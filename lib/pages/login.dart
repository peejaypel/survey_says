import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                //Logo
                children: [Text("LOGO")],
              ),
              // Spacer(
              //   flex: 1,
              // ),
              Row(
                children: [Text("Sign in")],
              ),
              Row(children: const [
                Text(
                  "Get started by signing in",
                  style: TextStyle(fontSize: 30),
                )
              ]),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email", hintText: "john@doe.com"),
                ),
              ),
              Container(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "*******",
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [TextButton(
                  onPressed: null,
                  child: Text("Login"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurpleAccent),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                  ),
                ),
                ],),
              ),
              // Spacer(
              //   flex: 5,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
