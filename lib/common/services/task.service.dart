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
      await box.put(task.id, task.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Delete task
  Future<void> delete(String id) async {
    final tasksBox = await getBox(boxName);
    await tasksBox.delete(id);
  }

  /// Mark task as complete


  /// Set task priority

}