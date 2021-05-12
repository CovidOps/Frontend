import 'package:covigenix/helper.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PatientProfile extends StatefulWidget {
  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  final GlobalKey<FormState> _patientKey = GlobalKey<FormState>();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  late String initialPhone, initialName, initialArea, initialAddress;
  late String getLatitude, getLongitude;
  late Position _currentPosition;
  TextEditingController area = TextEditingController(), address = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialPhone = Helper.getPhone();
    initialName = Helper.getName();
    initialArea = Helper.getArea();
    initialAddress = Helper.getAddress();
    area.text = initialArea;
    address.text = initialAddress;

    getLongitude = "Longitude: ${Helper.getLongitude()}";
    getLatitude = "Latitude: ${Helper.getLatitude()}";
  }
  void getLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        getLatitude = "Latitude: ${_currentPosition.latitude}";
        getLongitude = "Longitude: ${_currentPosition.longitude}";

        Helper.setCoordinates(_currentPosition.longitude, _currentPosition.latitude);
      });
    }).catchError((e) {
      print(e);
    });
  }
  void update(BuildContext context){
    if(_patientKey.currentState!.validate()){
      String ar = area.text;
      String ad = address.text;
      Helper.updateProfile(area: ar, address: ad);
      Helper.goodToast("Updating patient with $ar $ad ${Helper.getLongitude()} ${Helper.getLatitude()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _patientKey,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                  contentPadding: EdgeInsets.all(16),
                ),
                enabled: false,
                initialValue: initialName,
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
                //initialValue: initialArea,
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
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                controller: address,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Address",
                  contentPadding: EdgeInsets.all(16),
                ),
                //initialValue: initialAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid address.";
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
                child: Text('Update'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(16),
                ),
                onPressed: () {
                  update(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
