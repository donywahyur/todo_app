import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerJudul = TextEditingController();
    TextEditingController controllerDesk = TextEditingController();
    AppBar myAppBar = AppBar(
      title: const Text('Add Todo'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
    // double heightBody = MediaQuery.of(context).size.height -
    //     myAppBar.preferredSize.height -
    //     MediaQuery.of(context).padding.top;
    // double widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: myAppBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataTodo.add(Todo(
              id: DateTime.now().toString(),
              title: controllerJudul.text,
              description: controllerDesk.text));
          Navigator.pop(context);
        },
        child: const Icon(Icons.add_task),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: controllerJudul,
                decoration: InputDecoration(
                  hintText: 'Judul',
                  border: OutlineInputBorder(),
                ),
                maxLength: 20,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controllerDesk,
                decoration: InputDecoration(
                  hintText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
