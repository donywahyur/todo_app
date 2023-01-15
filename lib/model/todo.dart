class Todo {
  Todo(
      {required this.id,
      required this.title,
      required this.description,
      this.isDone = false});

  final String id;
  final String title;
  final String description;
  bool isDone;
}

List<Todo> dataTodo = [
  Todo(
      id: DateTime.now().toString(),
      title: 'Tugas Kuliah',
      description: 'Deskripsi',
      isDone: false),
  Todo(
      id: DateTime.now().toString(),
      title: 'Memasak Ikan Bakar',
      description: 'Deskripsi',
      isDone: false),
];
