import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'todo.dart';

class Data extends Equatable {
	final List<Todo>? todo;

	const Data({this.todo});

	factory Data.fromMap(Map<String, dynamic> data) => Data(
				todo: (data['todo'] as List<dynamic>?)
						?.map((e) => Todo.fromMap(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toMap() => {
				'todo': todo?.map((e) => e.toMap()).toList(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
	factory Data.fromJson(String data) {
		return Data.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
	String toJson() => json.encode(toMap());

	Data copyWith({
		List<Todo>? todo,
	}) {
		return Data(
			todo: todo ?? this.todo,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [todo];
}
