import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todolist/common/services/hive.service.dart';

import '../classes/task.class.dart';

class TaskService extends HiveService{
  static const boxName = 'task';

  /// List of all tasks
  Future<List<Task>> list() async {
    final box = await getBox(boxName);
    final tasks = await box.getAllValues();
    final List<Task> taskList = [];

    for(var entry in tasks.entries) {
      final Map<String, dynamic> data = { ...entry.value, 'id': entry.key };
      taskList.add(Task.fromJson(data));
    }
    return taskList;
  }

  /// Add new task
  Future<bool> create(Task task) async {
    try {
      final box = await getBox(boxName);
      final id = shortHash(UniqueKey());

      await box.put(id.toString(), task.toJson());
      return true;

    } catch (e) {
      print('Create task service: ${e}');
      return false;
    }
  }

  /// Delete task
  Future<bool> delete(String id) async {
    try {
      final box = await getBox(boxName);
      await box.delete(id);
      return true;
    } catch (e) {
      print('Delete task service: ${e}');
      return false;
    }
  }

  /// Mark task as complete


  /// Set task priority

}