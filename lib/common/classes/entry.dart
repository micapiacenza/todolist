import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todolist/common/classes/task.class.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
class Entry with _$Entry {
  const factory Entry({
    required String id,
    required Task task,
  }) = _Entry;



  factory Entry.fromJson(Map<String, dynamic> json) =>
      _$EntryFromJson(json);
}