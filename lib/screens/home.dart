import 'package:flutter/material.dart';
import '../constants/colors.dart';

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
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Align(
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
          ),
          Center( 
            child : Container(
              height: 78,
              width: 256,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                      }
                      return null; // Use the component's default.
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                  child: Text('Entra aquí',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
              )   
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