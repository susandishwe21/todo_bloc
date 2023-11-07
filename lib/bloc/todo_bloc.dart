import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<AddToDoEvent>(_addToDoTask);
  }

  Future<void> _addToDoTask(
    AddToDoEvent event,
    Emitter<TodoState> emit,
  ) async {
    List<Todo> todoList = List.from(state.todos)..insert(0, event.todo);
    debugPrint(todoList.first.title);
    TodoState(todos: todoList);
  }
}
