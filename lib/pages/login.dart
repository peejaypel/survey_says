import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey_says/helpers/loginsql.dart';
import 'package:survey_says/models/user.dart';
import 'package:survey_says/pages/home.dart';
import 'package:survey_says/pages/register.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              controller: usernameController,
              decoration: const InputDecoration(
                  labelText: "Username", hintText: "johndoe"),
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
          SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextButton(
                  onPressed: () async {
                    User user = User(username: usernameController.text, password: passwordController.text);
                    if (await LoginSQLHelper.instance.hasUser(user)){
                      if (await LoginSQLHelper.instance.login(user)){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
                      } else {
                        _showMyDialog(context, "invalid credentials");
                      }
                    } else {
                      _showMyDialog(context, "user does not exist");
                    }
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Register()));
                    },
                    child: const Text("Don't have an account?"),
                  )
                ],
              ),
            ],
    ),
    ),
    )
    ,
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
