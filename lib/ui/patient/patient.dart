import 'package:covigenix/helper.dart';
import 'package:covigenix/ui/Agreement_policy/acc_use_policy.dart';
import 'package:covigenix/ui/Agreement_policy/contact_us.dart';
import 'package:covigenix/ui/Agreement_policy/disclaimer.dart';
import 'package:covigenix/ui/Agreement_policy/privacy_policy%20.dart';
import 'package:covigenix/ui/Agreement_policy/t%20_and_c.dart';
import 'package:covigenix/ui/patient/patient_services.dart';
import 'package:covigenix/ui/prediction/prediction.dart';
import 'package:covigenix/ui/splash.dart';
import 'package:flutter/material.dart';

class PatientHome extends StatefulWidget {
  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {

  int navIndex = 0;
  String titleArg = "Prediction";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text(titleArg, style: TextStyle(fontSize: 24),)),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.logout),
                  tooltip: 'Log Out',
                  onPressed: () {
                    Helper.logOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => Splash()),
                    );
                    /*Scaffold.of(context).showSnackBar(
                        const SnackBar(content: Text('Log out')));*/
                  },
                );
              }
            ),
          ]
      ),
      drawer: Sidenav(navIndex, (int index) {
        setState(() {
          navIndex = index;
          switch(index){
            case 0: titleArg = "Prediction";
            break;
            case 1: titleArg = "Provider";
            break;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6: titleArg = "CovidOps";
            break;
          }
        });
      }),

      body: Builder(
        builder: (context){
          switch (navIndex) {
            case 0: return Prediction();
            case 1: return PatientServices();
            case 2: return disclaimer();
            case 3: return acc_use_policy();
            case 4: return t_and_c();
            case 5: return privacy_policy();
            case 6: return contact_us();

            //case 2: //Navigator pop
              //return Container();
          }
          return Container();
        },
      )
    );
  }
}

class Sidenav extends StatelessWidget {

  final int selectedIndex;
  final Function setIndex;

  Sidenav(this.selectedIndex, this.setIndex);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(Helper.appName, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 21),)
          ),
          DrawerHeader(
              decoration: BoxDecoration(

                  image: DecorationImage(
                    scale:0.3,
                    image: ExactAssetImage("assets/images/logo.png"),
                    fit:BoxFit.fill,
                  )
              ),
              child: null
          ),

          //Divider(color: Colors.grey.shade400,),

          _navItem(context, Icons.add_alert, 'Prediction',
            onTap: () {_navItemClicked(context, 0);},
            selected: selectedIndex==0
          ),

          //Divider(color: Colors.grey.shade400,),

          _navItem(context, Icons.apps, 'Services',
              onTap: () {_navItemClicked(context, 1);},
              selected: selectedIndex==1
          ),
          _navItem(context, Icons.app_settings_alt_rounded, 'Disclaimer',
              onTap: () {_navItemClicked(context, 2);},
              selected: selectedIndex==2
          ),
          _navItem(context, Icons.article_outlined, 'Acceptable Use of Policy',
              onTap: () {_navItemClicked(context, 3);},
              selected: selectedIndex==3
          ),
          _navItem(context, Icons.assignment_outlined, 'Terms and Conditions',
              onTap: () {_navItemClicked(context, 4);},
              selected: selectedIndex==4
          ),
          _navItem(context, Icons.lock, 'Privacy Policy',
              onTap: () {_navItemClicked(context, 5);},
              selected: selectedIndex==5
          ),
          _navItem(context, Icons.perm_phone_msg_rounded, 'Contact Us',
              onTap: () {_navItemClicked(context, 6);},
              selected: selectedIndex==6
          ),

          //Divider(color: Colors.grey.shade400,),

          /*_navItem(context, Icons.logout, 'Log Out',
              onTap: () {_navItemClicked(context, 2);},
              selected: selectedIndex==2
          ),*/
        ],
      ),
    );
  }

  _navItem(BuildContext context, IconData icon, String text, {Text? suffix, Function? onTap, bool selected = false}) => Container(
    color: selected ? Colors.grey.shade300 : Colors.transparent,
    child: ListTile(
      leading: Icon(icon, color: selected ? Theme.of(context).primaryColor : Colors.black),
      trailing: suffix,
      title: Text(text),
      selected: selected,
      onTap: () => {onTap!()},
    ),
  );

  _navItemClicked(BuildContext context, int index) {
    setIndex(index);
    Navigator.of(context).pop();
  }
}


