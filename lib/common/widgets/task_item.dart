import 'package:flutter/material.dart';
import 'package:todolist/common/constants/app_sizes.dart';

import '../classes/task.class.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
