import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class HomepageState extends StatefulWidget {
  const HomepageState({super.key});

  @override
  State<HomepageState> createState() => _HomepageStateState();
}

class _HomepageStateState extends State<HomepageState> {
  List<Todo> todos = dataTodo;
  @override
  Widget build(BuildContext context) {
    AppBar myAppBar = AppBar(
      title: const Text('Todo App'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: myAppBar,
      body: SingleChildScrollView(
        child: SizedBox(
          height: heightBody,
          width: widthBody,
          child: Column(
            children: [
              Container(
                width: widthBody,
                height: heightBody * 0.15,
                // color: Colors.amber,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your task...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    final todosFilter = dataTodo
                        .where((element) => element.title
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();

                    setState(() {
                      todos = todosFilter;
                    });
                  },
                ),
              ),
              SizedBox(
                height: heightBody * 0.85,
                width: widthBody,
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                child: todos.isNotEmpty
                    ? ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: ((context, index) {
                          return CheckboxListTile(
                            secondary: IconButton(
                                onPressed: () {
                                  setState(() {
                                    todos.removeAt(index);
                                  });
                                },
                                icon: const Icon(Icons.delete)),
                            subtitle: Text(todos[index].description,
                                style: TextStyle(
                                    decoration: todos[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none)),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(todos[index].title,
                                style: TextStyle(
                                    decoration: todos[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none)),
                            value: todos[index].isDone,
                            onChanged: (value) {
                              setState(() {
                                todos[index].isDone = value!;
                              });
                            },
                          );
                        }))
                    : Container(
                        alignment: Alignment.topCenter,
                        child: const Text('Data tidak ditemukan')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
