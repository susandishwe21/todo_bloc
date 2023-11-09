import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../add_new_todo.dart';
import '../models/data/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';
part 'todo_bloc.g.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddToDoPressed>(_addToDoTask);
    on<DeleteToDoPressed>(_deleteToDoTask);
    on<UpdateToDoPressed>(_updateToDoTask);
    on<SelectedToDoPressed>(_showTaskBox);
  }

  Future<void> _addToDoTask(
    AddToDoPressed event,
    Emitter<TodoState> emit,
  ) async {
    int indexUpdate = state.todos.indexWhere(
      (existingOrder) =>
          existingOrder.title.toString().trim() == state.title.trim(),
    );
    if (indexUpdate == -1) {
      emit(TodoState(todos: List.from(state.todos)..insert(0, event.todo)));
    } else {
      List<Todo> todoList = state.todos;
      todoList[indexUpdate] = event.todo;
      emit(TodoState(todos: List.from(state.todos)));
    }

    debugPrint(state.todos.first.title);
  }

  Future<void> _deleteToDoTask(
    DeleteToDoPressed event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoState(todos: List.from(state.todos)..remove(event.todo)));
  }

  Future<void> _updateToDoTask(
    UpdateToDoPressed event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoState(title: event.title, todos: state.todos));
  }

  Future<void> _showTaskBox(
    SelectedToDoPressed event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoState(isUpdate: event.isSelected, todos: state.todos));
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) => TodoState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(TodoState state) => state.toJson();
}
