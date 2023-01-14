import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todolist/common/enums/task_priority.dart';
import 'package:todolist/common/providers/task_list_provider.dart';
import 'package:todolist/common/services/task.service.dart';
import 'package:todolist/screens/all_tasks/all_tasks.dart';
import 'package:todolist/screens/completed_tasks_list/completed_tasks_list.dart';

import '../classes/task.class.dart';

/// Screens Index Provider
final StateProvider<int> indexProvider = StateProvider<int>((_) => 0);

final List<Widget> _screens = [
  AllTasks(),
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


/// Task Form Provider
class TaskFormProvider extends StateNotifier<Task> {
 late final Ref ref;
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 final TextEditingController taskController = TextEditingController();

  TaskFormProvider(this.ref, Task model) : super(model) {
    taskController.text = model.name;
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
    final success = await TaskService().create(state);
    if (success) {
      //append to list
      // ref.read(taskListProvider.notifier).add(state);
      return true;
    }
    return success;
  }
}

final StateNotifierProvider<TaskFormProvider, Task> taskFormProvider = StateNotifierProvider<TaskFormProvider, Task>((ref) => TaskFormProvider(ref, Task(id: '0', name: '', isComplete: false, priority: TaskPriority.low)));
