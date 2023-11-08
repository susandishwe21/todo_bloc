import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';

import 'models/data/todo.dart';

class AddTodoTaskScreen extends StatelessWidget {
  const AddTodoTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtAddTextController = TextEditingController();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                controller: txtAddTextController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Todo todos =
                    Todo(title: txtAddTextController.text, isDone: false);
                context.read<TodoBloc>().add(AddToDoEvent(todo: todos));
              },
              child: const Text(
                "ADD",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ))
        ],
      ),
    );
  }
}
