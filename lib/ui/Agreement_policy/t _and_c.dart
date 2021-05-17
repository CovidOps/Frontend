
import 'package:flutter/material.dart';

class t_and_c extends StatefulWidget {
  @override
  _t_and_cState createState() => _t_and_cState();
}

class _t_and_cState extends State<t_and_c> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/cough.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6),BlendMode.dstATop),
            ),

          ),
          child: null
      ),
    );
  }
}
