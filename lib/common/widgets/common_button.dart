import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback function;

  CommonButton({required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    OutlinedButton.styleFrom(
      side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
    );

    return OutlinedButton(
      style: style,
      onPressed: () => function(),
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
