import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/common/services/hive.service.dart';
import 'package:todolist/root.dart';

import 'common/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupHive();
  await Hive.initFlutter();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: lightTheme,
      home: const Root(),
    );
  }
}
