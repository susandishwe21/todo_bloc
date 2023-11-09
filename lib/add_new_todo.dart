import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/home_screen.dart';

import 'models/data/todo.dart';

TextEditingController txtAddTextController = TextEditingController();

class AddTodoTaskScreen extends StatelessWidget {
  const AddTodoTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: null,
                controller: txtAddTextController,
                decoration: const InputDecoration(border: InputBorder.none),
                // decoration: InputDecoration(
                //   contentPadding:
                //       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //   disabledBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: const BorderSide(color: Colors.red),
                //   ),
                //   enabledBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide(
                //         color: Theme.of(context)
                //             .colorScheme
                //             .primary
                //             .withOpacity(0.5)),
                //   ),
                //   focusedBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide(
                //         color: Theme.of(context).colorScheme.primary),
                //   ),
                // ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    if (txtAddTextController.text.isNotEmpty) {
                      Todo todos =
                          Todo(title: txtAddTextController.text, isDone: false);
                      context.read<TodoBloc>().add(AddToDoPressed(todo: todos));
                      txtAddTextController.clear();
                    } else {
                      showDialog(
                          barrierColor: Colors.transparent,
                          barrierDismissible: true,
                          context: context,
                          builder: (index) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: const Text(
                                      "Please fill todo task",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Positioned(
                                    right: -20,
                                    top: -20,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: CircleAvatar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        radius: 13,
                                        child: const Icon(
                                          Icons.clear,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  },
                  child: const Text(
                    "ADD",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
