import 'package:flutter/material.dart';

void showGenericDialog(
  BuildContext context, {
  required String title,
  Widget message = const Text(""),
  bool dismissible = true,
  required String buttonText,
}) {
  showDialog(
    barrierDismissible: dismissible,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black87),
        ),
        content: message,
        actions: [
          TextButton(
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
