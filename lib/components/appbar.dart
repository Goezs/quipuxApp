import 'package:flutter/material.dart';
import 'package:quipux_app/constants/colors.dart';
import 'package:quipux_app/main.dart';

_buildAppBar() {
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