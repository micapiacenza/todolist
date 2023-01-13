import 'package:flutter/material.dart';
import 'package:todolist/common/constants/app_sizes.dart';

import '../../common/widgets/common_dialog.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      title: 'New Task',
      functionOk: () => Navigator.pop(context),
      child: Column(
        children: [
          Text('What do you have to do?'),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
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
    );
  }
}
