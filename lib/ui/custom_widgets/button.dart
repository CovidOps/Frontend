import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {

  final String text;
  final void Function() onPressed;

  CustomButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.orange
      ),
      child: Center(
          child:TextButton(
            onPressed: onPressed,
            child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          )
      ),
    );
  }
}
