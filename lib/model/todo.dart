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
      ToDo(id: '01', todoText: 'Buy Daily Supplies', isDone: true ),
      ToDo(id: '02', todoText: 'Check Emails', isDone: true ),
      ToDo(id: '03', todoText: 'App Dev Project', ),
      ToDo(id: '04', todoText: 'Evening Walk', ),
      ToDo(id: '05', todoText: 'Team Meeting', ),
    ];
  }
}