part of 'todo_bloc.dart';

@JsonSerializable()
class TodoState extends Equatable {
  final List<Datum> todos;

  const TodoState({this.todos = const []});

  @override
  List<Object> get props => [todos];
}
