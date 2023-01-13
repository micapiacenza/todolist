import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todolist/screens/completed_tasks_list/completed_tasks_list.dart';
import 'package:todolist/screens/tasks_list/tasks_list.dart';

// Screens Index
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
