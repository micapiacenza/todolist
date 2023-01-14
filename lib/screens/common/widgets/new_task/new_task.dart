import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/common/constants/app_sizes.dart';
import 'package:todolist/common/widgets/snack_messages.dart';

import '../../../../common/providers/task_form.provider.dart';
import '../../../../common/widgets/common_dialog.dart';

class NewTask extends ConsumerWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskprovider = ref.read(taskFormProvider.notifier);
    final task = ref.watch(taskFormProvider);

    return CommonDialog(
      title: 'New Task',
      functionOk: () async {
        final success = await taskprovider.submit();
        if (success == null) {
          SnackError(message: 'Ops, something went wrong...');
          return;
        }
        if(success) {
          SuccessError(message: 'New task has been added to your to-do list!');
          Navigator.pop(context);
        }
      },
      child: Form(
        key: taskprovider.formKey,
        child: Column(
          children: [
            Text('What do you have to do?'),
            TextFormField(
              controller: taskprovider.taskNameController,
              validator: taskprovider.taskValidator,
            ),
            gapH24,
            Text('What is this task priority?'),
            Slider(
                value: 2,
                max: 3,
                divisions: 2,
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
