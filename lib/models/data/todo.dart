import 'dart:convert';

import 'package:equatable/equatable.dart';

class Todo extends Equatable {
	final String? title;
	final bool? isDone;

	const Todo({this.title, this.isDone});

	factory Todo.fromMap(Map<String, dynamic> data) => Todo(
				title: data['title'] as String?,
				isDone: data['is_done'] as bool?,
			);

	Map<String, dynamic> toMap() => {
				'title': title,
				'is_done': isDone,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Todo].
	factory Todo.fromJson(String data) {
		return Todo.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Todo] to a JSON string.
	String toJson() => json.encode(toMap());

	Todo copyWith({
		String? title,
		bool? isDone,
	}) {
		return Todo(
			title: title ?? this.title,
			isDone: isDone ?? this.isDone,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [title, isDone];
}
