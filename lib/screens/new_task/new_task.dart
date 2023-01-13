import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/common/constants/app_sizes.dart';
import 'package:todolist/common/widgets/snack_error.dart';

import '../../common/providers/providers.dart';
import '../../common/widgets/common_dialog.dart';

class NewTask extends ConsumerWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskprovider = ref.watch(taskFormProvider.notifier);
    return CommonDialog(
      title: 'New Task',
      functionOk: () async {
        final success = taskprovider.submit();
        if (success == null) {
          SnackError(message: 'Ops, something went wrong...');
        }
      },
      child: Form(
        key: taskprovider.formKey,
        child: Column(
          children: [
            Text('What do you have to do?'),
            TextFormField(
              controller: taskprovider.taskController,
              validator: taskprovider.taskValidator,
            ),
            gapH24,
            Text('What is this task priority?'),
            Slider(
                value: 2,
                max: 3,
                divisions: 3,
                onChanged: (double val) {
                  print(val);
                },
            )
          ],
        ),
      ),
    );
  }
}
