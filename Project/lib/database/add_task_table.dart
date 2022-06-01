final String tableAddTask = 'addtask';

class add_task {
  static final List<String> values = [
    //add all fields
    id, task_name, category,
  ];

  static final String id = '_id';
  static final String task_name = 'task_name';
  static final String category = 'category';
}

class Task {
  int id;
  String task_name;
  String category;
  Task({
    this.id,
    this.task_name,
    this.category,
  });

  Map<String, Object> toJson() => {
        add_task.id: id,
        add_task.task_name: task_name,
        add_task.category: category,
      };

  Task copy({
    int id,
    String task_name,
    String category,
  }) =>
      Task(
        id: id ?? this.id,
        task_name: task_name ?? this.task_name,
        category: category ?? this.category,
      );

  static Task fromJson(Map<String, Object> json) => Task(
        id: json[add_task.id] as int,
        task_name: json[add_task.task_name] as String,
        category: json[add_task.category] as String,
      );
}
