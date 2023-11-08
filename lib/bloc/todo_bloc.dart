import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/data/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';
part 'todo_bloc.g.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddToDoEvent>(_addToDoTask);
  }

  Future<void> _addToDoTask(
    AddToDoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoState(todos: List.from(state.todos)..insert(0, event.todo)));
    debugPrint(state.todos.first.title);
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) => TodoState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(TodoState state) => state.toJson();
}
