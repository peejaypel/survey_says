import 'package:flutter/cupertino.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            //Logo
            children: [Text("LOGO")],
          ),
          Row(
            children: [Text("Sign in")],
          ),
          Row(children: const [
            Text(
              "Get started by signing in",
              style: TextStyle(fontSize: 30),
            )
          ]),
        ],
      ),
    );
  }
}
