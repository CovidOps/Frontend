import 'dart:convert';

import 'package:covigenix/helper.dart';
import 'package:covigenix/ui/custom_widgets/essential_checklist.dart';
import 'package:covigenix/ui/model/generic_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  EssentialChecklist screen = EssentialChecklist();

  void _editEssentials(BuildContext context) async{
    List<String> essentials = List<String>.empty(growable: true);
    screen.status.forEach((key, value) {if(value == true) essentials.add(key);});

    final response = await http.put(
      Uri.https(Helper.BASE_URL, "provider/${Helper.getId()}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'essentials': essentials,
      }),
    );

    if(response.statusCode == 200){
      GenericResponse res = GenericResponse.fromJson(jsonDecode(response.body));
      Helper.goodToast(res.message);
    }
    else
      throw Exception('Failed to update provider');
  }

  @override
  void initState() {
    super.initState();
    /*List<EssentialGridModel> list = Helper.essentialsList;
    for(EssentialGridModel e in list){
      status[e.arg] = false;
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: screen,
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
                _editEssentials(context);
              },
            ),
          ),
        ],
    );
  }
}
