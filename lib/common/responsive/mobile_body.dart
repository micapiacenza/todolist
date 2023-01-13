import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../widgets/bottom_nav_bar.dart';
import '../theme/theme.dart';

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
        bottomNavigationBar: BottomNavBar(),
        body: ref.watch(bodyProvider),
      ),
    );
  }
}
