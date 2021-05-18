import 'package:flutter/material.dart';
import 'package:covigenix/helper.dart';
class CallIcon extends StatelessWidget {
  final String number;
  CallIcon(this.number);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(
          Icons.call,
          color: Colors.green,
        ),
        onPressed: () => Helper.call(number),
        splashRadius: 22,
      ),
    );
  }
}
