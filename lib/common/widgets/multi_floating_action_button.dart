import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../screens/common/widgets/new_task/new_task.dart';
import '../../screens/common/widgets/tasks_info/tasks_info.dart';
import '../constants/app_sizes.dart';
import '../theme/theme.dart';


class MultiFloatingActionButton extends StatelessWidget {
  final List<Widget> children;

  const MultiFloatingActionButton({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children.map((child) => Padding(
        padding: EdgeInsets.symmetric(vertical: Sizes.p4),
        child: SizedBox(
          height: Sizes.p48,
          width: Sizes.p48,
          child: child,
        ),
      )).toList(),
    );
  }
}




class AddButton extends ConsumerWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      backgroundColor: lightTheme.primaryColor,
      onPressed: () async {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => NewTask()
        );
      },
      child: Icon(Icons.add),
    );
  }
}

class InfoButton extends ConsumerWidget {
  const InfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      backgroundColor: lightTheme.primaryColor,
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => TasksInfo()
      ),
      child: Icon(Icons.info_outlined),
    );
  }
}
