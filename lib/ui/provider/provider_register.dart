import 'dart:convert';

import 'package:covigenix/helper.dart';
import 'package:covigenix/ui/custom_widgets/essential_checklist.dart';
import 'package:covigenix/ui/custom_widgets/progress.dart';
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

  //final Geolocator geolocator = Geolocator();
  late String initialPhone, getLatitude, getLongitude;
  late Position? _currentPosition;
  bool isLoading = false;
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
    setState(() {
      isLoading = true;
    });

    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        getLatitude = "Latitude: ${position.latitude}";
        getLongitude = "Longitude: ${position.longitude}";

        setState(() {
          isLoading = false;
        });
      });
    }).catchError((e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    });
  }

  void register(BuildContext context) {
    if (_registerProviderKey.currentState!.validate()) {
      if (_currentPosition == null) {
        Helper.goodToast("Please obtain location.");
        return;
      }
      List<String> essentials = List<String>.empty(growable: true);
      screen.status.forEach((key, value) {
        if (value == true) essentials.add(key);
      });
      if (essentials.isEmpty) {
        Helper.goodToast("Please select at least one essential.");
        return;
      }

      createProvider(
          name.text, initialPhone, area.text, _currentPosition!.longitude,
          _currentPosition!.latitude);
    }
  }

  void createProvider(String name, String phone, String area, double longi,
      double lati) async {
    setState(() {
      isLoading = true;
    });

    List<String> essentials = List<String>.empty(growable: true);
    screen.status.forEach((key, value) {
      if (value == true) essentials.add(key);
    });

    final response = await http.post(
      Uri.https(Helper.BASE_URL, "provider/sign-up"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'phone': phone,
        'area': area,
        'coordinates': [longi, lati],
        'essentials': essentials
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      Response res = Response.fromJson(jsonDecode(response.body));
      Helper.goodToast(res.message!);
      if (res.code == 200) {
        goToProviderHome(context, res.id!);
      }
    } else {
      throw Exception('Failed to create Service provider');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Stack(
          children: [
            Form(
              key: _registerProviderKey,
              child: Column(
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                    child: ElevatedButton(
                      child: Text('Get Location'),
                      style: ElevatedButton.styleFrom(
                        primary: Theme
                            .of(context)
                            .primaryColor,
                        padding: EdgeInsets.all(16),
                      ),
                      onPressed: getLocation,
                    ),
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                    child: ElevatedButton(
                      child: Text('Register'),
                      style: ElevatedButton.styleFrom(
                        primary: Theme
                            .of(context)
                            .primaryColor,
                        padding: EdgeInsets.all(16),
                      ),
                      onPressed: () {
                        register(context);
                      },
                    ),
                  ),
                  Container(
                    height:70,
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      image:DecorationImage(
                          image:AssetImage("assets/images/logo.png",),
                          fit:BoxFit.fitHeight

                      ),
                    ),
                  ),
                ],
              ),
            ),
            (isLoading ? CustomProgressIndicator() : Container()),
          ],
        ),
    );
  }

  void goToProviderHome(BuildContext context, String id) {
    Future.delayed(const Duration(milliseconds: 500), () {
      Helper.setProfile(
          loginStatus: Helper.TYPE_PATIENT,
          id: id,
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

class Response {
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
