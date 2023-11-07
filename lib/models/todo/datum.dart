import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
	final String? title;
	final bool? isDone;

	const Datum({this.title, this.isDone});

	factory Datum.fromDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse(Map<String, dynamic> data) {
		return Datum(
			title: data['title'] as String?,
			isDone: data['is_done'] as bool?,
		);
	}



	Map<String, dynamic> toDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse() {
		return {
			'title': title,
			'is_done': isDone,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toDataTitleHiiIsDoneFalseTitleHiiIsDoneFalseTitleHiiIsDoneFalse());

	Datum copyWith({
		String? title,
		bool? isDone,
	}) {
		return Datum(
			title: title ?? this.title,
			isDone: isDone ?? this.isDone,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [title, isDone];
}
