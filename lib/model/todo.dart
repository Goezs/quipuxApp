class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Análisis de datos de la página web', isDone: true ),
      ToDo(id: '02', todoText: 'Base de datos de la página web', ),
      ToDo(id: '03', todoText: 'frontend de la página web', isDone: true ),
      ToDo(id: '04', todoText: 'backend de la página web', ),
    ];
  }
}