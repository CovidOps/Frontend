import 'package:covigenix/ui/community/community.dart';
import 'package:covigenix/ui/patient/my_requests.dart';
import 'package:covigenix/ui/patient/patient_essentials_home.dart';
import 'package:covigenix/ui/patient/patient_profile.dart';
import 'package:flutter/material.dart';

class PatientServices extends StatefulWidget {

  @override
  _PatientServicesState createState() => _PatientServicesState();
}

class _PatientServicesState extends State<PatientServices> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    PatientEssentialsHome(),
    Community(),
    MyRequests(),
    //PatientProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My Requests',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),*/
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
