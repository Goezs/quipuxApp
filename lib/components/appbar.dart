import 'package:flutter/material.dart';
import 'package:quipux_app/constants/colors.dart';

buildAppBar(context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: tdBGColor,
    elevation: 0,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: tdBGColor,
            shadowColor: Colors.transparent,
          ),
          child: Image.asset('assets/images/quipux_logo.png'),
          onPressed : () {
            Navigator.popAndPushNamed(context, '/');
          }
        )
    ]),
  );
}