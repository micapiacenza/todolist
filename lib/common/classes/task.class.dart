import '../enums/task_priority.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.class.freezed.dart';
part 'task.class.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String name,
    required TaskPriority priority,
    required bool isComplete,
  }) = _Task;



  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}