import 'package:covigenix/ui/custom_widgets/progress.dart';
import 'package:covigenix/ui/login_screen.dart';
import 'package:covigenix/ui/patient/patient.dart';
import 'package:covigenix/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:covigenix/helper.dart';
class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<int>(
        builder: (context, snapshot){
          int status = Helper.getLoginStatus();

          Future.delayed(const Duration(milliseconds: 500), () {
            if(status == Helper.TYPE_LOGOUT){
              //Go to login
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
              );
            }else if(status == Helper.TYPE_PROVIDER){
              //Go to provider
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => ProviderHome()),
              );
            }else{
              //Go to patient
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => PatientHome()),
              );
            }
          });
          //return CustomProgressIndicator();
          return Container();
        }
      ),
    );
  }
}
