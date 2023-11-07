import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_new_todo.dart';
import 'bloc/todo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        title: const Text(
          "ToDo",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: buildToDoListRecord(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddNewToDoDialog(context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildToDoListRecord() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                      )
                    ]),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_box_outline_blank_rounded,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      child: Text(
                        state.todos[index].title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.edit,
                        color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 15),
                    const Icon(Icons.delete, color: Colors.red)
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => Container(),
            itemCount: state.todos.length,
          ),
        );
      },
    );
  }
}
