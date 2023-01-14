import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/common/constants/app_sizes.dart';
import 'package:todolist/common/providers/task_list_provider.dart';

import '../../../../common/enums/task.enum.dart';
import '../../../../common/widgets/common_dialog.dart';


class TasksInfo extends ConsumerWidget {
  const TasksInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.read(taskListProvider(TaskListType.all));

    return CommonDialog(
      title: 'Tasks Info',
      functionOk: () => Navigator.pop(context),
      child: Column(
        children: [
          Text('Total Tasks: ${tasks.length}'),
          gapH16,
          Text('Total Completed Tasks: ${tasks.where((task) => task.isComplete).length}'),
        ],
      ),
    );
  }
}
