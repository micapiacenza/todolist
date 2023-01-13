import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/common/theme/theme.dart';
import 'package:todolist/screens/tasks_info/tasks_info.dart';

import '../../common/constants/app_sizes.dart';
import '../../common/providers/providers.dart';
import '../../common/widgets/task_item.dart';
import '../new_task/new_task.dart';

class TasksList extends ConsumerWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);

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
                itemBuilder: (context, position) => TaskItem(task: tasks[position]),
              ),
            ],
          ),
        ),
        Positioned(
          right: 5,
            bottom: 8,
            child: ButtonPannel()),
      ],
    );
  }
}

class ButtonPannel extends StatelessWidget {
  const ButtonPannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              backgroundColor: lightTheme.primaryColor,
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => NewTask()
              ),
              child: Icon(Icons.add),
            ),
          ),
          gapH12,
          Container(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              backgroundColor: lightTheme.primaryColor,
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => TasksInfo()
              ),
              child: Icon(Icons.info_outlined),
            ),
          )
        ],
      ),
    );
  }
}

