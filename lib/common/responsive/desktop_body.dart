import 'package:flutter/material.dart';

import '../../screens/all_tasks/all_tasks.dart';
import '../../screens/completed_tasks_list/completed_tasks_list.dart';
import '../theme/theme.dart';
import '../widgets/multi_floating_action_button.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('To-do List',
                style: TextStyle(color: lightTheme.unselectedWidgetColor)
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tasks List'),
                Tab(text: 'Completed Tasks'),
              ],

            ),
          ),
          floatingActionButton: MultiFloatingActionButton(
            children: [
              AddButton(),
              InfoButton()
            ],
          ),
          body: TabBarView(
            children: [
              AllTasks(),
              CompletedTasksList()
            ],
          ),
        ),
    );
  }
}
