import '../enums/task_priority.dart';

class Task {
  late int id;
  late String task;
  late TaskPriority priority;
  late bool isComplete = false;

  Task({
    required this.id,
    required this.task,
    required this.priority,
  });
}