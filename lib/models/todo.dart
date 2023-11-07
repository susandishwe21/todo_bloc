class Todo {
  final String title;
  final bool isDone;

  Todo({required this.title, this.isDone = false});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(title: json['title'].toString());
  }
}
