part of 'todo_bloc.dart';

@JsonSerializable()
class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  @override
  List<Object> get props => [todos];

  factory TodoState.fromJson(Map<String, dynamic> json) =>
      _$TodoStateFromJson(json);
  Map<String, dynamic> toJson() => _$TodoStateToJson(this);

  TodoState copyWith({List<Todo>? todo}) {
    return TodoState(todos: todo ?? todos);
  }
}
