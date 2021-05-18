import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final IconData icon;
  final String str;

  RowWidget(this.icon, this.str);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Row(
        children: [
          /*Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon),
              Expanded(child: Container(), flex: 1,)
            ],
          ),*/
          Icon(icon),
          Expanded(child: Text(str))
        ],
      ),
    );
  }
}
