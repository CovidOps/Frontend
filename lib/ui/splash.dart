import 'package:flutter/material.dart';
import 'package:covigenix/helper.dart';
class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    _checkLogin();
    return Scaffold(
      body:CircularProgressIndicator(),
    );
  }

  void _checkLogin() async{
    int status = Helper.getLoginStatus();

    if(status == Helper.TYPE_LOGOUT){
      //Go to login
    }else if(status == Helper.TYPE_PROVIDER){
      //Go to provider
    }else{
      //Go to patient
    }
  }
}
