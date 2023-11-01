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
          ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text('Nombre del estudiante',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ), 
                    Text(studentName,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                      ),
                    ), 
                    Text('Correo del estudiante',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ), 
                    Text(studentEmail,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                      ),
                    ), 
                    Text('Documento de identidad',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(studentItt,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                      ),
                    ), 
                  ], 
                ) 
              ), 
              SortableTable(),
              searchBox(),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        'Lista de tareas',
                        style: TextStyle(
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
              )
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

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ), prefixIconConstraints: BoxConstraints( maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}