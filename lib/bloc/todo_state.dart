part of 'todo_bloc.dart';

@JsonSerializable()
class TodoState extends Equatable {
  final List<Todo> todos;
  final bool isUpdate;
  final String title;

  const TodoState({
    this.todos = const [],
    this.isUpdate = false,
    this.title = "",
  });

  @override
  List<Object> get props => [todos, isUpdate, title];

  factory TodoState.fromJson(Map<String, dynamic> json) =>
      _$TodoStateFromJson(json);
  Map<String, dynamic> toJson() => _$TodoStateToJson(this);

  TodoState copyWith({List<Todo>? todo}) {
    return TodoState(todos: todo ?? todos);
  }
}
