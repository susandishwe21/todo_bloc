// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoState _$TodoStateFromJson(Map<String, dynamic> json) => TodoState(
      todos: (json['todos'] as List<dynamic>?)
              ?.map((e) => Todo.fromJson(e as String))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TodoStateToJson(TodoState instance) => <String, dynamic>{
      'todos': instance.todos,
    };
