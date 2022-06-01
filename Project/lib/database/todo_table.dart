final String tableAddTodo = 'todo';

class todo_field {
  static final List<String> values = [
    todo_id,
    todo,
    cat_name,
  ];

  static final String todo_id = '_id';
  static final String todo = 'todo';
  static final String cat_name = 'cat_name';
}

class Todo {
  int todo_id;
  String todo;
  String cat_name;
  String current_time;
  Todo({
    this.todo_id,
    this.todo,
    this.cat_name,
  });

  Map<String, Object> toJson() => {
        todo_field.todo_id: todo_id,
        todo_field.todo: todo,
        todo_field.cat_name: cat_name,
      };

  Todo copy({
    int todo_id,
    String todo,
    String cat_name,
  }) =>
      Todo(
        todo_id: todo_id ?? this.todo_id,
        todo: todo ?? this.todo,
        cat_name: cat_name ?? this.cat_name,
      );

  static Todo fromJson(Map<String, Object> json) => Todo(
        todo_id: json[todo_field.todo_id] as int,
        todo: json[todo_field.todo] as String,
        cat_name: json[todo_field.cat_name] as String,
      );
}
