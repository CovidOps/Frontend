import 'package:flutter/material.dart';
class RowWidget extends StatelessWidget {
  final IconData icon;
  final String str;

  RowWidget(this.icon, this.str);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [Icon(icon), Text(str)],
      ),
    );
  }
}