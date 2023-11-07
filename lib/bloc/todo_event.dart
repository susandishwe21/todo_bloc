part of 'todo_bloc.dart';

class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddToDoEvent extends TodoEvent {
  const AddToDoEvent({required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}
