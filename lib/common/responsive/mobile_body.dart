import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screens/common/widgets/new_task/new_task.dart';
import '../../screens/common/widgets/tasks_info/tasks_info.dart';
import '../constants/app_sizes.dart';
import '../providers/providers.dart';
import '../widgets/bottom_nav_bar.dart';
import '../theme/theme.dart';
import '../widgets/multi_floating_action_button.dart';

class MobileBody extends ConsumerWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('To-do List',
              style: TextStyle(color: lightTheme.unselectedWidgetColor)
          ),
        ),
        floatingActionButton: MultiFloatingActionButton(
          children: [
            AddButton(),
            InfoButton()
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
        body: ref.watch(bodyProvider),
      ),
    );
  }
}
