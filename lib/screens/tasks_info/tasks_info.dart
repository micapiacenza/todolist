import 'package:flutter/material.dart';
import 'package:todolist/common/constants/app_sizes.dart';

import '../../../common/widgets/common_dialog.dart';

class TasksInfo extends StatelessWidget {
  const TasksInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      title: 'Tasks Info',
      functionOk: () => Navigator.pop(context),
      child: Column(
        children: [
          Text('Total Tasks: x'),
          gapH16,
          Text('Total Completed Tasks: y'),
        ],
      ),
    );
  }
}
