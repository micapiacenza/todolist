import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/common/enums/task_priority.dart';

import '../classes/task.class.dart';

enum TaskListType { all, completed }

/// Tasks Provider
class TaskListProvider extends StateNotifier<List<Task>> {
  final Ref ref;
  final TaskListType type;

  TaskListProvider(this.ref, this.type, [List<Task> initial = const []]) : super(initial);

  list () {
    state = []; // TODO
  }


  void add(Task task) {
    state = [...state, task];
  }

  void delete(String id) {
    state = state.where((task) => task.id != id).toList();
  }
}

final taskListProvider = StateNotifierProvider.family<TaskListProvider, List<Task>, TaskListType>((ref, type) {
  final tasks = [
    Task(id: '1', name: 'Do my bed', priority: TaskPriority.low, isComplete: false),
    Task(id: '2', name: 'Buy groceries', priority: TaskPriority.medium, isComplete: false),
    Task(id: '3', name: 'Read 10 pages', priority: TaskPriority.high, isComplete: false),
  ];

  return TaskListProvider(ref, type, tasks);
});