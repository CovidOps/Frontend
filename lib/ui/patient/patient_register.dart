import 'dart:convert';

import 'package:covigenix/ui/custom_widgets/progress.dart';
import 'package:covigenix/ui/patient/patient.dart';
import 'package:covigenix/helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class RegisterPatient extends StatefulWidget {
  @override
  _RegisterPatientState createState() => _RegisterPatientState();
}

class _RegisterPatientState extends State<RegisterPatient> {
  final GlobalKey<FormState> _registerPatientKey = GlobalKey<FormState>();
  //final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  late String initialPhone, getLatitude, getLongitude;
  late Position? _currentPosition;
  Future<Response>? _futureResponse = null;

  TextEditingController name = TextEditingController(),
      area = TextEditingController(),
      address = TextEditingController();

  @override
  void initState() {
    // TODO: initialPhone
    super.initState();
    _currentPosition = null;
    getLatitude = "Latitude: Not Known";
    getLongitude = "Longitude: Not Known";
    initialPhone = Helper.getPhone();
  }

  void getLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        getLatitude = "Latitude: ${position.latitude}";
        getLongitude = "Longitude: ${position.longitude}";
      });
    }).catchError((e) {
      print(e);
    });
  }

  void register(BuildContext context) {
    if (_registerPatientKey.currentState!.validate()) {
      if(_currentPosition == null){
        Helper.goodToast("Please obtain location.");
        return;
      }

      /*String message = "Got data: ${name.text} $initialPhone ${area.text} ${address.text} [ ${_currentPosition!.longitude}, ${_currentPosition!.latitude} ]";
      Helper.goodToast(message);

      Helper.setProfile(

      );*/

      setState(() {
        _futureResponse = createPatient(name.text, initialPhone, area.text, address.text, _currentPosition!.longitude, _currentPosition!.latitude);
      });
    }
  }

  Future<Response> createPatient(String name, String phone, String area, String address, double longi, double lati) async{
    final response = await http.post(
      Uri.https(Helper.BASE_URL, "patient/sign-up"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'phone': phone,
        'area': area,
        'address': address,
        'coordinates':[longi, lati]
      }),
    );

    if(response.statusCode == 200)
      return Response.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to create patient');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _registerPatientKey,
        child: (_futureResponse == null)? ListView(
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
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                controller: address,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Address",
                  contentPadding: EdgeInsets.all(16),
                ),
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
        )
            : FutureBuilder<Response>(
          future: _futureResponse,
          builder: (context, snapshot){
            if(snapshot.hasData){
              if(snapshot.data!.code == 200){
                Helper.goodToast(snapshot.data!.message!);
                goToPatientHome(context, snapshot);
              }
            }
            return CustomProgressIndicator();
          },
        )
      ),
    );
  }

  void goToPatientHome(BuildContext context, AsyncSnapshot<Response> snapshot) {
    Future.delayed(const Duration(milliseconds: 500), () {
      Helper.setProfile(
          loginStatus: Helper.TYPE_PATIENT,
          id: snapshot.data!.id!,
          name: name.text,
          phone: initialPhone,
          area: area.text,
          address: address.text,
          longi: _currentPosition!.longitude,
          lati: _currentPosition!.latitude
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PatientHome()));
    });
  }
}

class Response{
  int code;
  String? message, id;

  Response({required this.code, this.message, this.id});

  factory Response.fromJson(Map<String, dynamic> json){
    return Response(
      code: json["code"],
      message: json["message"],
      id: json["id"]
    );
  }
}
