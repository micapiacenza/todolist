import 'package:hive/hive.dart';
import 'package:todolist/common/services/hive.service.dart';

import '../classes/task.class.dart';

class TaskService extends HiveService{
  static const boxName = 'tasks';

  // Get all tasks
  Future<Map<String, Map>> getList() async {
    final tasksBox = await getBox(boxName);
    final tasks = await tasksBox.getAllValues();
    return tasks;
  }

  // Add new task
  Future<void> add(Task task) async {
    final tasksBox = await getBox(boxName);
    await tasksBox.put(task.id, task.toJson());
  }


  // Delete task
  Future<void> delete(String id) async {
    final tasksBox = await getBox(boxName);
    await tasksBox.delete(id);
  }


  // Mark task as complete


  // Set task priority

}