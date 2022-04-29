import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final VoidCallback? onPositiveButtonPressed;
  final VoidCallback? onNegativeButtonPressed;
  final String? positiveButtonText;
  final String? negativeButtonText;
  const CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.onPositiveButtonPressed,
      required this.onNegativeButtonPressed,
      required this.positiveButtonText,
      required this.negativeButtonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
      title: Text(
        title!,
        style: style.copyWith(fontSize: 18, color: Colors.black),
      ),
      content: Text(content!),
      actions: [
        TextButton(
            onPressed: onNegativeButtonPressed,
            child: Text(
              negativeButtonText!,
              style: style,
            )),
        TextButton(
            onPressed: onPositiveButtonPressed,
            child: Text(
              positiveButtonText!,
              style: style,
            )),
      ],
    );
  }
}

const style = TextStyle(fontSize: 17, fontWeight: FontWeight.w800);
