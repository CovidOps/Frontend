import 'package:covigenix/helper.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Patient'),
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
        });
      }),

      body: Builder(
        builder: (context){
          switch (navIndex) {
            case 0: return Prediction();
            case 1: return PatientServices();
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


