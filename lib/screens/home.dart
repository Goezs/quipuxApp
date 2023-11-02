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
          backgroundRectangleOne(),
          backgroundRectangleTwo(),
          introductionMessage(),
          Center( 
            child : SizedBox(
              height: 78,
              width: 256,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(95.0),
                  ),
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
          contactMessage(),
          Align(
            alignment: Alignment(-1, 1),
            child: SizedBox(
              height: 60,
              width: 59,
            )
          ),
          Align(
            alignment: Alignment(1, 0.77),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Row(
                  children: [
                    Icon(Icons.linked_camera_outlined),
                    Text('@Quipux',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )
                    )
                  ]
                ),
                const SizedBox(width: 33),
                Row(
                  children: [
                    Icon(Icons.language),
                    Text('Quipux.com',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )
                    )
                  ]
                ),
                const SizedBox(width: 33),
                Row(
                  children: [
                    Icon(Icons.facebook),
                    Text('Quipux',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )
                    )
                  ]
                )
              ],
            )
          )
        ]
      ),
    );
  }

  ShaderMask backgroundRectangleTwo() {
    return ShaderMask( 
          shaderCallback : (rect){
            return LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topCenter,
              colors: [Colors.white, tdBGColor],
            ).createShader(Rect.fromLTRB(500, 168, 315, 250));
          },
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(275 / 360),
            child: Align(
              alignment: const Alignment(-1.35, -0.4),
              child: SizedBox(
                height: 444,
                width: 182,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: tdBGColor,
                    borderRadius: BorderRadius.circular(77)
                  ),
                ),
              )
            )
          )
        );
  }

  ShaderMask backgroundRectangleOne() {
    return ShaderMask( 
          shaderCallback : (rect){
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [tdBGColor, Colors.white],
            ).createShader(Rect.fromLTRB(155, 209, 780, 25));
          },
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(81 / 360),
            child: Align(
              alignment: const Alignment(-1.5, -0.85),
              child: SizedBox(
                height: 434.48,
                width: 182,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: tdBGColor,
                    borderRadius: BorderRadius.circular(77)
                  ),
                ),
              )
            )
          )
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

  Align contactMessage() {
    return Align(
          alignment: Alignment(0.2, 0.55),
          child : Container(
            width: 240,
            height: 115,
            child: Text('Contáctanos en nuestras redes sociales',
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