import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/common/services/task.service.dart';
import 'package:todolist/common/theme/theme.dart';

import '../../../../common/constants/app_sizes.dart';
import '../../../../common/enums/task.enum.dart';
import '../../../../common/providers/task_list_provider.dart';
import '../../../../common/widgets/snack_messages.dart';
import '../../../../common/widgets/task_item.dart';
import '../new_task/new_task.dart';
import '../tasks_info/tasks_info.dart';

class TasksList extends ConsumerWidget {
  final TaskListType type;

  const TasksList({required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider(type));

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: tasks.length,
                separatorBuilder: (context, position) => dividerGrey,
                itemBuilder: (context, position) {
                  final task = tasks[position];

                  return Container(
                  color: lightTheme.errorColor,
                  child: Dismissible(
                      key: Key(task.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) async {
                        await TaskService().delete(task.id);
                        ref.read(taskListProvider(type).notifier).delete(position);

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackError(message: 'Task ${task.name} has been removed')
                        );
                      },
                      child: Container(
                        color: lightTheme.canvasColor,
                          child: TaskItem(task: task))
                  ),
                );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
