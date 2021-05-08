import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPatient extends StatefulWidget {
  @override
  _RegisterPatientState createState() => _RegisterPatientState();
}

class _RegisterPatientState extends State<RegisterPatient> {
  final GlobalKey<FormState> _registerPatientKey = GlobalKey<FormState>();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  late String initialPhone, getLatitude, getLongitude;
  late Position _currentPosition;
  TextEditingController name = TextEditingController(), area = TextEditingController();

  @override
  void initState() {
    // TODO: initialPhone
    super.initState();
    getLatitude = "Latitude: Not Known";
    getLongitude = "Longitude: Not Known";
    initialPhone = "7809601401";
  }

  void getLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        getLatitude = "Latitude: ${_currentPosition.latitude}";
        getLongitude = "Longitude: ${_currentPosition.longitude}";
      });
    }).catchError((e) {
      print(e);
    });
  }

  void register(BuildContext context) {
    if (_registerPatientKey.currentState!.validate()) {
      String message = "Got data: ${name.text} $initialPhone ${area.text}";
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _registerPatientKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                  contentPadding: EdgeInsets.all(16),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid name.";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone",
                  contentPadding: EdgeInsets.all(16),
                ),
                enabled: false,
                initialValue: initialPhone,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                controller: area,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Area",
                  contentPadding: EdgeInsets.all(16),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid area.";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              child: Text(
                getLatitude,
                style: TextStyle(fontSize: 16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            Container(
              child: Text(
                getLongitude,
                style: TextStyle(fontSize: 16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              child: ElevatedButton(
                child: Text('Get Location'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(16),
                ),
                onPressed: getLocation,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              child: ElevatedButton(
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(16),
                ),
                onPressed: () {
                  register(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
