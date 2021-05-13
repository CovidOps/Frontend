import 'dart:convert';

import 'package:covigenix/helper.dart';
import 'package:covigenix/ui/model/generic_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddCommunity extends StatelessWidget {
  final GlobalKey<FormState> _patientKey = GlobalKey<FormState>();
  TextEditingController item = TextEditingController(), description = TextEditingController();

  int type;
  AddCommunity(this.type);

  void createPost(BuildContext context, String item, String details) async{
    final response = await http.post(
      Uri.https(Helper.BASE_URL, "community/$type"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'personId': Helper.getId(),
        'name': Helper.getName(),
        'phone': Helper.getPhone(),
        'area': Helper.getArea(),
        'item': item,
        'details': details,
        'coordinates':[Helper.getLongitude(), Helper.getLatitude()]
      }),
    );

    if(response.statusCode == 200){
      GenericResponse res = GenericResponse.fromJson(jsonDecode(response.body));
      if(res.code == 200){
        Helper.goodToast(res.message!);
        Navigator.of(context).pop();
      }
    }else{
      Helper.goodToast("Error!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Community Post"),),
      body: Form(
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
                initialValue: Helper.getName(),
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
                initialValue: Helper.getPhone(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Area",
                  contentPadding: EdgeInsets.all(16),
                ),
                enabled: false,
                initialValue: Helper.getArea(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                controller: item,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: (type == Helper.TYPE_REQUEST ? "Name of Item Requested" : "Name of Item Available"),
                  contentPadding: EdgeInsets.all(16),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid item name.";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                controller: description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Description of item: place, amount, cost etc.",
                  contentPadding: EdgeInsets.all(16),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid description.";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              child: ElevatedButton(
                child: Text('Create Post'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(16),
                ),
                onPressed: () {
                  if(_patientKey.currentState!.validate()){
                    createPost(
                      context,
                      item.text,
                      description.text,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}