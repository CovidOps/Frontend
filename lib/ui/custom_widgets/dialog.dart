import 'package:flutter/material.dart';
class CustomDialog extends StatelessWidget {
  String title, body, yesTitle, noTitle;
  Function yesFunction;

  CustomDialog({
    required this.title,
    required this.body,
    required this.yesTitle,
    this.noTitle = "Cancel",
    required this.yesFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(body),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(noTitle),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(yesTitle),
          onPressed: () {
            Navigator.of(context).pop();
            yesFunction();
          },
        ),
      ],
    );
  }
}
