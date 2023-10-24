import 'package:flutter/material.dart';
import '../constants/colors.dart';

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
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Text('Bienvenido',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100),
              ),
            ) 
          ), 
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/student');
              },
              child: Center(
                child: Text('Ingresar',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w400),
                ),
              ),
            )   
          )
        ]
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            child: Image.asset('assets/images/quipux_logo.png'),
            onPressed : () {
              Navigator.popAndPushNamed(context, '/');
            } 
          )
        ),
      ]),
    );
  }
}