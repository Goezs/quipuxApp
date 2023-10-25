import 'package:flutter/material.dart';
import 'package:quipux_app/components/appbar.dart';
import 'package:quipux_app/constants/colors.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          Center(
            child: Text('Bienvenido',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100),
            ),
          ), 
          Align(
            alignment: const Alignment(0, 0),
            child : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: tdBGColor,
                shadowColor: tdBGColor,
              ), 
                child: const Text('Entra aquí',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/student');
              },
            )
          )
        ]
      ),
    );
  }
}