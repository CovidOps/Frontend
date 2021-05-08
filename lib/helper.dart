import 'package:shared_preferences/shared_preferences.dart';

class Helper{
  static final String BASE_URL = "http://192.168.1.5:3000/";

  static final String LOGIN_STATUS = "LoginStatus";
  static final int TYPE_LOGOUT = -1, TYPE_PROVIDER = 0, TYPE_PATIENT = 1;

  static final String NAME = "name", PHONE = "phone", AREA = "area", LATITUDE = "latitude", LONGITUDE = "longitude";

  static int getLoginStatus(){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    return (prefs.getInt(LOGIN_STATUS) ?? -1);
  }

  static void setLoginStatus(int status){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    prefs.setInt(LOGIN_STATUS, status);
  }

  static String getName(){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    return (prefs.getString(NAME) ?? "NONAME");
  }

  static void setName(String name){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    prefs.setString(NAME, name);
  }

  static String getPhone(){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    return (prefs.getString(PHONE) ?? "NOPHONE");
  }

  static void setPhone(String phone){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    prefs.setString(PHONE, phone);
  }

  static String getArea(){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    return (prefs.getString(AREA) ?? "NOAREA");
  }

  static void setArea(String area){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    prefs.setString(AREA, area);
  }

  static double getLatitude(){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    return (prefs.getDouble(LATITUDE) ?? 0.0);
  }

  static void setLatitude(double lati){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    prefs.setDouble(LATITUDE, lati);
  }

  static double getLongitude(){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    return (prefs.getDouble(LONGITUDE) ?? 0.0);
  }

  static void setLongitude(double longi){
    SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
    prefs.setDouble(LONGITUDE, longi);
  }
}