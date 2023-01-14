import 'package:todolist/common/services/hive.service.dart';

import '../classes/task.class.dart';

class TaskService extends HiveService{
  static const boxName = 'tasks';

  // Get all_tasks
  Future<dynamic> list() async {
    final tasksBox = await getBox(boxName);
    final tasks = await tasksBox.getAllValues();
    print(tasks);

    return tasks.entries.map((entry) => Task.fromJson({entry.key: entry.value})).toList();
  }

  // Add new task
  Future<bool> create(Task task) async {
    try {
      final tasksBox = await getBox(boxName);
      await tasksBox.put(task.id, task.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }


  // Delete task
  Future<void> delete(String id) async {
    final tasksBox = await getBox(boxName);
    await tasksBox.delete(id);
  }


  // Mark task as complete


  // Set task priority

}