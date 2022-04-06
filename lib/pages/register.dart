import 'package:flutter/material.dart';
import 'package:survey_says/helpers/loginsql.dart';
import 'package:survey_says/models/user.dart';
import 'package:survey_says/pages/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final LoginSQLHelper loginHelper = LoginSQLHelper.instance;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(flex: 1),
              Row(
                children: const [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    hintText: "John Doe",
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "*******",
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  User user = User(
                      username: usernameController.text,
                      password: passwordController.text);
                  if (await loginHelper.hasUser(user)) {
                    print("has user!");
                    _showMyDialog(context, "user already exists na po");
                  } else {
                    print("registered");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Home()));
                    loginHelper.addUser(user);
                  }
                },
                child: Text("Register"),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Already have an account?"),
                  )
                ],
              ),
              Row(),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context, String text) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('warning!!!!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('$text'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('k'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
