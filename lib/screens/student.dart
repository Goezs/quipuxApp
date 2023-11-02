import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import 'package:quipux_app/components/appbar.dart';
import 'package:quipux_app/widgets/grade_table.dart';

class Student extends StatefulWidget {
  Student({
    Key? key,
    required this.studentName,
    required this.studentEmail,
    required this.studentItt
    }) : super(key: key);

  String studentName, studentEmail, studentItt;

  @override
  State<Student> createState() {
    return _StudentState(
      studentName,
      studentEmail,
      studentItt
      );
    }
}

class _StudentState extends State<Student> {
  String studentName, studentEmail, studentItt;
  _StudentState(this.studentName, this.studentEmail, this.studentItt);

  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  bool showStudentTable = false;
  bool showGradeTable = false;

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          ShaderMask( 
            shaderCallback : (rect){
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [tdBGColor, Colors.white],
              ).createShader(Rect.fromLTRB(50, 250, 10, 350));
            },
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(60 / 360),
              child: Align(
                alignment: const Alignment(-1.9, -3),
                child: SizedBox(
                  height: 492,
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
          ),
          ShaderMask( 
            shaderCallback : (rect){
              return LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [Colors.red, Colors.white],
              ).createShader(Rect.fromLTRB(280, 230, 390, 880));
            },
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(130 / 360),
              child: Align(
                alignment: const Alignment(2.34, 0.8),
                child: SizedBox(
                  height: 494,
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
          ),
          ListView(
            children: [
              const SizedBox(height: 59),
              SizedBox(
                height: 39,
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      showStudentTable =  !showStudentTable;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBGColor,
                    shadowColor: Colors.white,
                  ),
                  child: Text('Datos del estudiante',
                    style: TextStyle(
                      color: tdBlack, 
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ), 
              Visibility(
                visible: showStudentTable,
                child: SingleChildScrollView( 
                  scrollDirection: Axis.vertical,
                  child: FittedBox(
                    child: DataTable(
                      columns: [
                      DataColumn(label: Text('Nombre')),
                      DataColumn(label: Text('Documento de identidad')),
                      DataColumn(label: Text('Correo')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(studentName)),
                          DataCell(Text(studentItt)),
                          DataCell(Text(studentEmail)),
                        ])
                      ],
                      decoration: BoxDecoration(
                        color: tdBGColor,
                        border: Border.all(
                          color: tdBGColor,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35)
                        ),
                      )
                    ) 
                  )
                )
              ),
              const SizedBox(height: 59),
              SizedBox(
                height: 43,
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      showGradeTable =  !showGradeTable;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBGColor,
                    shadowColor: Colors.white,
                  ),
                  child: Text('Notas del estudiante',
                    style: TextStyle(
                      color: tdBlack, 
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: showGradeTable,
                child: SortableTable(),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: Text(
                      'Lista de tareas',
                      style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                  for (ToDo todoo in _foundToDo.reversed)
                    ToDoItem(
                      todo: todoo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                    ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new todo item',
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }
}