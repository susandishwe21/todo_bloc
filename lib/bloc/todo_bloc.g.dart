// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'todo_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoState _$TodoStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TodoState',
      json,
      ($checkedConvert) {
        final val = TodoState(
          todos: $checkedConvert(
              'todos',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => Datum.fromJson(e as String))
                      .toList() ??
                  const []),
        );
        return val;
      },
    );
