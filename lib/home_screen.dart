import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/models/data/todo.dart';

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
        child: Column(
          children: [const AddTodoTaskScreen(), buildToDoListRecord()],
        ),
      ),
    );
  }

  Widget buildToDoListRecord() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        debugPrint("To Do Bloc ${state.todos}");
        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                debugPrint(state.todos[index].title);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
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
                        Expanded(
                          flex: 10,
                          child: Text(
                            state.todos[index].title ?? "",
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
                        IconButton(
                            onPressed: () {
                              Todo todos = Todo(
                                title: state.todos[index].title,
                                isDone: false,
                              );
                              context
                                  .read<TodoBloc>()
                                  .add(DeleteToDoPressed(todo: todos));
                            },
                            icon: const Icon(Icons.delete, color: Colors.red)),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(),
              itemCount: state.todos.length,
            ),
          ),
        );
      },
      buildWhen: (previous, current) {
        return previous.todos != current.todos;
      },
    );
  }
}
