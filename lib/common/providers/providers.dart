import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todolist/common/enums/task_priority.dart';
import 'package:todolist/common/widgets/snack_error.dart';
import 'package:todolist/screens/completed_tasks_list/completed_tasks_list.dart';
import 'package:todolist/screens/tasks_list/tasks_list.dart';

import '../classes/task.class.dart';

// Screens Index Provider
final StateProvider<int> indexProvider = StateProvider<int>((_) => 0);

final List<Widget> _screens = [
  TasksList(),
  CompletedTasksList(),
];

final StateProvider<Widget?> widgetNavigatorProvider = StateProvider<Widget?>((_) => null);

final StateProvider<Widget> bodyProvider = StateProvider<Widget>((ref) {
  final Widget? widget = ref.watch(widgetNavigatorProvider);
  if (widget != null) {
    return widget;
  }
  final int index = ref.watch(indexProvider);
  return _screens[index];
});

// Tasks Provider
class TaskListProvider extends StateNotifier<List<Task>> {
  TaskListProvider() : super([]);
  init() {
    state = [
      Task(id: '1', task: 'task 1', priority: TaskPriority.low, isComplete: false)
    ];
  }

  void add(Task task) {
    state = [...state, task];
  }

  void delete(String id) {
    state = state.where((task) => task.id != id).toList();
  }

  void markAsComplete(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return task.copyWith(isComplete: true);
      }
      return task;
    }).toList();
  }

  void setPriority(String id, TaskPriority priority) {
    state = state.map((task) {
      if (task.id == id) {
        return task.copyWith(priority: priority);
      }
      return task;
    }).toList();
  }
}

final taskListProvider = StateNotifierProvider<TaskListProvider, List<Task>>((ref) {
  final taskListProvider = TaskListProvider();
  taskListProvider.init();
  return taskListProvider;
});

class TaskFormProvider extends StateNotifier<Task> {
 late final Ref ref;
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 final TextEditingController taskController = TextEditingController();

  TaskFormProvider(this.ref, Task model) : super(model) {
    taskController.text = model.task;
  }

  String? taskValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid task';
    }
    return null;
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    // TODO: Create with hive
  }
}

final StateNotifierProvider<TaskFormProvider, Task> taskFormProvider = StateNotifierProvider<TaskFormProvider, Task>((ref) => TaskFormProvider(ref, Task(id: '0', task: '', isComplete: false, priority: TaskPriority.low)));
