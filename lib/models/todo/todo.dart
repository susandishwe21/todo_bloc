import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class Todo extends Equatable {
	final List<Datum>? data;

	const Todo({this.data});

	factory Todo.fromDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse(Map<String, dynamic> data) {
		return Todo(
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse() {
		return {
			'data': data?.map((e) => e.toDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Todo].
	factory Todo.fromJson(String data) {
		return Todo.fromDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Todo] to a JSON string.
	String toJson() => json.encode(toDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse());

	Todo copyWith({
		List<Datum>? data,
	}) {
		return Todo(
			data: data ?? this.data,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [data];
}
