
import 'package:flutter/material.dart';

class contact_us extends StatefulWidget {
  @override
  _contact_usState createState() => _contact_usState();
}

class _contact_usState extends State<contact_us> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/contact.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6),BlendMode.dstATop),
            ),

          ),
          child: null
      );
  }
}
