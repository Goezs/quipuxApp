import 'package:flutter/material.dart';
import 'package:quipux_app/components/appbar.dart';
import 'package:quipux_app/constants/colors.dart';
import 'package:quipux_app/screens/student.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _studentController = TextEditingController();
  final _studentEmailController = TextEditingController();
  final _studentIttController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          backgroundRectangleOne(),
          backgroundRectangleTwo(),
          backgroundRectangleTrhee(),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const Align(
                  alignment: Alignment(0, 2),
                  child: Text('Ingresa tus datos',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 45,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
                MyTextField(
                  myController: _studentController,
                  fieldName: "Nombres y apellidos",
                  myIcon: Icons.person,
                  prefixIconColor: Colors.deepPurple.shade300
                ),
                const SizedBox(height: 40.0),
                //Use to add space between Textfields
                MyTextField(
                  myController: _studentEmailController,
                  fieldName: "Correo electrónico",
                  myIcon: Icons.email,
                  prefixIconColor: Colors.deepPurple.shade300
                ),
                const SizedBox(height: 40.0),
                MyTextField(
                  myController: _studentIttController,
                  fieldName: "Documento de identidad",
                  myIcon: Icons.badge,
                  prefixIconColor: Colors.deepPurple.shade300
                ),
                const SizedBox(height: 80.0),
                myBtn(context),
              ],
            ),
          ),
        ]
      ),
    );
  }

  ShaderMask backgroundRectangleTrhee() {
    return ShaderMask( 
          shaderCallback : (rect){
            return const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topCenter,
              colors: [tdGreen, Colors.white],
            ).createShader(const Rect.fromLTRB(450, 20, 0, 250));
          },
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(160 / 360),
            child: Align(
              alignment: const Alignment(2.0, -1.8),
              child: SizedBox(
                height: 472,
                width: 169.13,
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

  ShaderMask backgroundRectangleTwo() {
    return ShaderMask( 
          shaderCallback : (rect){
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [tdGreen, Colors.white],
            ).createShader(const Rect.fromLTRB(290, 20, 0, 250));
          },
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(160 / 360),
            child: Align(
              alignment: const Alignment(0.2, 4.8),
              child: SizedBox(
                height: 594,
                width: 169.13,
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
            return const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topCenter,
              colors: [tdGreen, Colors.white],
            ).createShader(const Rect.fromLTRB(550, 20, 0, 250));
          },
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(160 / 360),
            child: Align(
              alignment: const Alignment(-1.6, 1.0),
              child: SizedBox(
                height: 472,
                width: 169.13,
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

  //Function that returns OutlinedButton Widget also it pass data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(200, 50),
        backgroundColor: tdBlueDark,
        shadowColor: tdBGColor,
        ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Student(
              studentName: _studentController.text,
              studentEmail: _studentEmailController.text,
              studentItt: _studentIttController.text,
            );
          }),
        );
      },
      child: Text(
        "Ingresar".toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 30
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });
  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade300),
          ),
          labelStyle: const TextStyle(color: Colors.deepPurple)),
    );
  }
}
