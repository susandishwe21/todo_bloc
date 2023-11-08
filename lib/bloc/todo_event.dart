part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddToDoPressed extends TodoEvent {
  const AddToDoPressed({required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class DeleteToDoPressed extends TodoEvent {
  const DeleteToDoPressed({required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}
