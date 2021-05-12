import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';

class Helper{
  static final String BASE_URL = "http://192.168.1.5:3000/";

  static final String LOGIN_STATUS = "LoginStatus";
  static final int TYPE_LOGOUT = -1, TYPE_PROVIDER = 0, TYPE_PATIENT = 1;

  static final String ID = "id", NAME = "name", PHONE = "phone", AREA = "area", LATITUDE = "latitude", LONGITUDE = "longitude", ADDRESS = "address";
  static final String LS_KEY = "Local.json", USER = "User";

  static int getLoginStatus(){
    return new LocalStorage(LS_KEY).getItem(LOGIN_STATUS) ?? -1;
  }

  static void setProfile({int loginStatus = -1, String id = "", String name = "", String phone = "", String area = "", double lati = 0.0, double longi = 0.0, String address = ""}){
    final LocalStorage localStorage = new LocalStorage(LS_KEY);
    Map<String, dynamic> map = (localStorage.getItem(USER) ?? Map<String, dynamic>());
    map[LOGIN_STATUS] = loginStatus;
    map[ID] = id;
    map[NAME] = name;
    map[PHONE] = phone;
    map[AREA] = area;
    map[LONGITUDE] = longi;
    map[LATITUDE] = lati;
    map[ADDRESS] = address;
    localStorage.setItem(USER, map);
  }

  static String getId(){
    return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[ID] ?? "";
  }

  static String getName(){
    return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[NAME] ?? "";
  }

  static String getPhone(){
    return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[PHONE] ?? "";
  }

  static String getArea(){
    return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[AREA] ?? "";
  }

  static double getLatitude(){
    return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[LATITUDE] ?? 0.0;
  }

  static double getLongitude() {
    return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[LONGITUDE] ?? 0.0;
  }

  static String getAddress(){
    return (new LocalStorage(LS_KEY).getItem(USER) as Map<String, dynamic>? ?? Map<String, dynamic>())[ADDRESS] ?? "";
  }

  static void setCoordinates(double longi, double lati){
    final LocalStorage localStorage = new LocalStorage(LS_KEY);
    Map<String, dynamic> map = (localStorage.getItem(USER) ?? Map<String, dynamic>());
    map[LONGITUDE] = longi;
    map[LATITUDE] = lati;
    localStorage.setItem(USER, map);
  }

  static void updateProfile({String area = "", String address = ""}){
    final LocalStorage localStorage = new LocalStorage(LS_KEY);
    Map<String, dynamic> map = (localStorage.getItem(USER) ?? Map<String, dynamic>());
    int type = (map[LOGIN_STATUS] ?? TYPE_PROVIDER);
    map[AREA] = area;
    if(type == TYPE_PATIENT){
      map[ADDRESS] = address;
    }
    localStorage.setItem(USER, map);
  }

  static HashMap<int, String> createMap(){
    HashMap<int, String> map = HashMap();
    map.putIfAbsent(0, () => "Remdesivir");
    map.putIfAbsent(0, () => "Oxygen");
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
}