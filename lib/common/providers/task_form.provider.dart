import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/common/enums/task.enum.dart';
import 'package:todolist/common/providers/task_list_provider.dart';

import '../classes/task.class.dart';
import '../services/task.service.dart';

/// Task Form Provider
class TaskFormProvider extends StateNotifier<Task> {
  late final Ref ref;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController taskController = TextEditingController();

  TaskFormProvider(this.ref, Task model) : super(model) {
    load(model);
    formListener();
  }

  load(Task task) {
    state = task;
    taskController.text = task.name;
  }

  formListener() {
    taskController.addListener(() {
      state = state.copyWith(name: taskController.text);
    });
  }

  void clear() {
    // Empty task
    load(Task(id: '', name: '', isComplete: false, priority: TaskPriority.low));
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
      ref.read(taskListProvider(TaskListType.all).notifier).append(state);
      clear();
      return true;
    }
    return false;
  }
}

final StateNotifierProvider<TaskFormProvider, Task> taskFormProvider = StateNotifierProvider<TaskFormProvider, Task>((ref) => TaskFormProvider(ref, Task(id: '', name: '', isComplete: false, priority: TaskPriority.low)));
