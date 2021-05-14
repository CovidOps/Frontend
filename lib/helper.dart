import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:localstorage/localstorage.dart';

class Helper{
  static const String BASE_URL = "covigenix-test-deploy.herokuapp.com";

  static const String LOGIN_STATUS = "LoginStatus";
  static const int TYPE_LOGOUT = -1, TYPE_PROVIDER = 0, TYPE_PATIENT = 1;
  static const int TYPE_REQUEST = 0, TYPE_AVAILABILITY = 1;

  static const String ID = "id", NAME = "name", PHONE = "phone", AREA = "area", LATITUDE = "latitude", LONGITUDE = "longitude", ADDRESS = "address";
  static const String LS_KEY = "Local.json", USER = "User";

  static int getLoginStatus(){
    return (GetStorage().read(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[LOGIN_STATUS] ?? -1;
    //return new LocalStorage(LS_KEY).getItem(LOGIN_STATUS) ?? -1;
  }

  static void setProfile({int loginStatus = -1, String id = "", String name = "", String phone = "", String area = "", double lati = 0.0, double longi = 0.0, String address = ""}){
    /*final LocalStorage localStorage = new LocalStorage(LS_KEY);
    Map<String, dynamic> map = (localStorage.getItem(USER) ?? Map<String, dynamic>());*/
    final GetStorage box = GetStorage();
    Map<String, dynamic> map = (box.read(USER) ?? Map<String, dynamic>());
    if(loginStatus != -1) map[LOGIN_STATUS] = loginStatus;
    if(id != "") map[ID] = id;
    if(name != "") map[NAME] = name;
    if(phone != "") map[PHONE] = phone;
    if(area != "") map[AREA] = area;
    if(longi != 0.0) map[LONGITUDE] = longi;
    if(lati != 0.0) map[LATITUDE] = lati;
    if(address != "") map[ADDRESS] = address;
    //localStorage.setItem(USER, map);
    box.write(USER, map);
  }

  static void logOut(){
    final GetStorage box = GetStorage();
    Map<String, dynamic> map = (box.read(USER) ?? Map<String, dynamic>());
    map[LOGIN_STATUS] = TYPE_LOGOUT;
    box.write(USER, map);
  }

  static String getId(){
    //return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic> ?? Map<String, dynamic>())[ID] ?? "";
    return (GetStorage().read(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[ID] ?? "";
  }

  static String getName(){
    return (GetStorage().read(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[NAME] ?? "";
  }

  static String getPhone(){
    //return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic> ?? Map<String, dynamic>())[PHONE] ?? "";
    return (GetStorage().read(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[PHONE] ?? "";
  }

  static String getArea(){
    //return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic> ?? Map<String, dynamic>())[AREA] ?? "";
    return (GetStorage().read(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[AREA] ?? "";
  }

  static double getLatitude(){
    //return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic> ?? Map<String, dynamic>())[LATITUDE] ?? 0.0;
    return (GetStorage().read(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[LATITUDE] ?? 0.0;
  }

  static double getLongitude() {
    //return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic> ?? Map<String, dynamic>())[LONGITUDE] ?? 0.0;
    return (GetStorage().read(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[LONGITUDE] ?? 0.0;
  }

  static String getAddress(){
    //return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic> ?? Map<String, dynamic>())[ADDRESS] ?? "";
    return (GetStorage().read(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[ADDRESS] ?? "";
  }

  static void setCoordinates(double longi, double lati){
    //final LocalStorage localStorage = new LocalStorage(LS_KEY);
    //Map<String, dynamic> map = (localStorage.getItem(USER) ?? Map<String, dynamic>());
    final GetStorage box = GetStorage();
    Map<String, dynamic> map = (box.read(USER) ?? Map<String, dynamic>());
    map[LONGITUDE] = longi;
    map[LATITUDE] = lati;
    //localStorage.setItem(USER, map);
    box.write(USER, map);
  }

  static void updateProfile({String area = "", String address = ""}){
    //final LocalStorage localStorage = new LocalStorage(LS_KEY);
    final GetStorage box = GetStorage();
    Map<String, dynamic> map = (box.read(USER) ?? Map<String, dynamic>());
    int type = (map[LOGIN_STATUS] ?? TYPE_PROVIDER);
    map[AREA] = area;
    if(type == TYPE_PATIENT){
      map[ADDRESS] = address;
    }
    box.write(USER, map);
  }

  static HashMap<int, String> createMap(){
    HashMap<int, String> map = HashMap();
    map.putIfAbsent(0, () => "Remdesivir");
    map.putIfAbsent(1, () => "Oxygen");
    return map;
  }

  static void goodToast(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static final List<EssentialGridModel> essentialsList = [
    EssentialGridModel("remdesivir", "Remdesivir", Icons.five_g),
    EssentialGridModel("oxygen", "Medical Oxygen", Icons.five_g),
    EssentialGridModel("plasma", "Plasma", Icons.five_g),
    EssentialGridModel("fabiflu", "Fabiflu", Icons.five_g)
  ];
}


class EssentialGridModel{
  final String arg, proper;
  final IconData icon;
  bool checked = false;
  EssentialGridModel(this.arg, this.proper, this.icon);
}