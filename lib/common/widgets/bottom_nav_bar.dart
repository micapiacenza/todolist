import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/common/providers/providers.dart';
import 'package:todolist/common/theme/theme.dart';

import '../constants/app_sizes.dart';

class BottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isOveridden = (ref.watch(widgetNavigatorProvider) != null);
    int _currentIndex = ref.watch(indexProvider);

    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: lightTheme.primaryColor,
      currentIndex: _currentIndex,
      items: [
        customBottomNavigationBarItem(
          'Tasks',
          Icons.list_alt,
          isOveridden ? 10 : _currentIndex,
          0,
        ),
        customBottomNavigationBarItem(
          'Completed Tasks',
          Icons.task_outlined,
          isOveridden ? 10 : _currentIndex,
          1,
        ),
      ],
      onTap: (int index) {
        ref.read(widgetNavigatorProvider.notifier).state = null;
        ref.read(indexProvider.notifier).state = index;
      },
    );
  }
}

BottomNavigationBarItem customBottomNavigationBarItem(String label, IconData icon, int currentIndex, int itemIndex) {
  bool isSelected = currentIndex == itemIndex;
  return BottomNavigationBarItem(
    icon: Column(
      children: [
        Icon(icon, size: 24.0, color: lightTheme.unselectedWidgetColor),
        gapH8,
        isSelected ? Underline() : Container(),
      ],
    ),
    label: label,
    backgroundColor: lightTheme.unselectedWidgetColor,
  );
}

class Underline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 2, width: 40.0, color: lightTheme.unselectedWidgetColor);
  }
}