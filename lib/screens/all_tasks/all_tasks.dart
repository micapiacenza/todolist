import 'package:flutter/material.dart';
import 'package:todolist/screens/common/widgets/tasks_list/tasks_list.dart';

import '../../common/enums/task.enum.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TasksList(type: TaskListType.all);
  }
}
