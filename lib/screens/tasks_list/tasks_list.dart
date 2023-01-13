import 'package:flutter/material.dart';
import 'package:todolist/common/enums/task_priority.dart';

import '../../common/classes/task.class.dart';
import '../../common/constants/app_sizes.dart';
import '../../common/widgets/task_item.dart';
import '../new_task/new_task.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = [
      Task(id: 1, task: 'Make Coffee', priority: TaskPriority.low),
      Task(id: 1, task: 'Make Coffee', priority: TaskPriority.low),
      Task(id: 1, task: 'Make Coffee', priority: TaskPriority.low),
      Task(id: 1, task: 'Make Coffee', priority: TaskPriority.low),
      Task(id: 1, task: 'Make Coffee', priority: TaskPriority.low),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tasks.length,
            separatorBuilder: (context, position) => dividerGrey,
            itemBuilder: (context, position) => TaskItem(task: tasks[position]),
          ),
          ButtonPannel(),
        ],
      ),
    );
  }
}

class ButtonPannel extends StatelessWidget {
  const ButtonPannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        children: [
          FloatingActionButton(
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => NewTask()
            ),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => NewTask()
            ),
            child: Icon(Icons.info_outlined),
          )
        ],
      ),
    );
  }
}

