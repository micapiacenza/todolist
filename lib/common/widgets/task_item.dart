import 'package:flutter/material.dart';
import 'package:todolist/common/constants/app_sizes.dart';
import 'package:todolist/common/services/task.service.dart';
import 'package:todolist/common/theme/theme.dart';
import 'package:todolist/common/widgets/snack_error.dart';

import '../classes/task.class.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightTheme.errorColor,
      child: Dismissible(
        key: Key(task.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) async {
          await TaskService().delete(task.id);
          ScaffoldMessenger.of(context).showSnackBar(
           SnackError(message: 'Task ${task.task} has been removed')
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          color: lightTheme.cardColor,
          child: Row(
            children: [
            Checkbox(
            checkColor: Colors.white,
            value: true,
            onChanged: (bool? value) {
                value = value!;
              }
              ),
              gapW12,
              Text('Task name ${task.task}'),
            ],
          ),
        ),
      ),
    );
  }
}
