import 'package:flutter/material.dart';

class ProviderRequestsIndiv extends StatefulWidget {
  String arg;
  ProviderRequestsIndiv(this.arg);

  @override
  _ProviderRequestsIndivState createState() => _ProviderRequestsIndivState();
}

class _ProviderRequestsIndivState extends State<ProviderRequestsIndiv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.arg),),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {
            //Get back when tapped
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
