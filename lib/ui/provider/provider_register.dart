import 'dart:convert';

import 'package:covigenix/helper.dart';
import 'package:covigenix/ui/custom_widgets/essential_checklist.dart';
import 'package:covigenix/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class RegisterProvider extends StatefulWidget {
  @override
  _RegisterProviderState createState() => _RegisterProviderState();
}

class _RegisterProviderState extends State<RegisterProvider> {
  final GlobalKey<FormState> _registerProviderKey = GlobalKey<FormState>();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  late String initialPhone, getLatitude, getLongitude;
  late Position? _currentPosition;
  Future<Response>? _futureResponse = null;
  EssentialChecklist screen = EssentialChecklist();

  TextEditingController name = TextEditingController(),
      area = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentPosition = null;
    getLatitude = "Latitude: Not Known";
    getLongitude = "Longitude: Not Known";
    initialPhone = Helper.getPhone();
  }

  void getLocation() {
    geolocator
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
    if (_registerProviderKey.currentState!.validate()) {
      if(_currentPosition == null){
        Helper.goodToast("Please obtain location.");
        return;
      }
      List<String> essentials = List<String>.empty(growable: true);
      screen.status.forEach((key, value) {if(value == true) essentials.add(key);});
      if(essentials.isEmpty){
        Helper.goodToast("Please select at least one essential.");
        return;
      }

      setState(() {
        _futureResponse = createProvider(name.text, initialPhone, area.text, _currentPosition!.longitude, _currentPosition!.latitude);
      });
    }
  }

  Future<Response> createProvider(String name, String phone, String area, double longi, double lati) async{
    List<String> essentials = List<String>.empty(growable: true);
    screen.status.forEach((key, value) {if(value == true) essentials.add(key);});

    final response = await http.post(
      Uri.https(Helper.BASE_URL, "provider/sign-up"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'phone': phone,
        'area': area,
        'coordinates':[longi, lati],
        'essentials': essentials
      }),
    );

    if(response.statusCode == 200)
      return Response.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to create provider');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _registerProviderKey,
        child: (_futureResponse == null)? Column(
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
            Expanded(
              child: screen,
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
                goToProviderHome(context, snapshot);
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ),
    );
  }

  void goToProviderHome(BuildContext context, AsyncSnapshot<Response> snapshot) {
    Future.delayed(const Duration(milliseconds: 500), () {
      Helper.setProfile(
          loginStatus: Helper.TYPE_PATIENT,
          id: snapshot.data!.id!,
          name: name.text,
          phone: initialPhone,
          area: area.text,
          longi: _currentPosition!.longitude,
          lati: _currentPosition!.latitude
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ProviderHome()));
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
