import 'package:flutter/material.dart';
import 'package:todolist/common/theme/theme.dart';

SnackBar SnackError({required String message}) {
  return SnackBar(
    backgroundColor: Colors.red[200],
    content: Text(message,
      style: lightTheme.textTheme.bodyText1,
      textAlign: TextAlign.center,
    ),
  );
}

SnackBar SuccessError({required String message}) {
  return SnackBar(
    backgroundColor: Colors.green[200],
    content: Text(message,
      style: lightTheme.textTheme.bodyText1,
      textAlign: TextAlign.center,
    ),
  );
}
