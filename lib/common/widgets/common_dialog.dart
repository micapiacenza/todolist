import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import 'common_button.dart';

class CommonDialog extends StatelessWidget {
  final Widget child;
  final String title;
  final VoidCallback? functionOk;

  CommonDialog({required this.child, required this.title, required this.functionOk});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.p20))
      ),
      title: Column(
        children: [
          Center(child: Text('${title}', style: Theme.of(context).textTheme.headline6)),
          gapH12,
          Divider(color: Theme.of(context).primaryColor, thickness: 2,)
        ],
      ),
      content: SingleChildScrollView(
          child: child
      ),
      actions: <Widget>[
        CommonButton(
          function: () => functionOk!(),
          text: 'OK',
        )
      ],
    );;
  }
}
