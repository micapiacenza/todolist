import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/common/enums/task_priority.dart';

import '../classes/task.class.dart';
import '../services/task.service.dart';

enum TaskListType { all, completed }

/// Tasks Provider
class TaskListProvider extends StateNotifier<List<Task>> {
  final Ref ref;
  final TaskListType type;

  TaskListProvider(this.ref, this.type, [List<Task> initial = const []]) : super(initial) {
    init();
  }

  init() async {
    final tasks = await TaskService().list();
    state = tasks;
  }

  append(Task task) async {
    state = [...state, task];
  }

  delete(int index) async {
    state = [...state]..removeAt(index);
  }

}

final taskListProvider = StateNotifierProvider.family<TaskListProvider, List<Task>, TaskListType>((ref, type) => TaskListProvider(ref, type));