import 'package:flutter/material.dart';
import 'package:quipux_app/components/appbar.dart';
import 'package:quipux_app/constants/colors.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          introductionMessage(),
          Center( 
            child : SizedBox(
              height: 78,
              width: 256,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                  child: const Text('Entra aquí',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
              )   
            )
          ),
          Align(
            alignment: Alignment(-1, 0.7),
            child: SizedBox(
              height: 38,
              width: 39,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: tdBGColor,
                ),
              ),
              )
            )
        ]
      ),
    );
  }

  Align introductionMessage() {
    return Align(
          alignment: Alignment(0, -0.7),
          child : Container(
            width: 240,
            height: 115,
            child: Text('¡Bienvenido, ingresa al colegio Quipux y mira tus notas!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400
              ),
            ) 
          ), 
        );
  }
}