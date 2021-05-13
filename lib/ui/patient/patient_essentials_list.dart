import 'dart:convert';

import 'package:covigenix/ui/model/generic_response.dart';
import 'package:covigenix/ui/custom_widgets/row_widget.dart';
import 'package:covigenix/ui/model/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../helper.dart';

class PatientEssentialsList extends StatefulWidget {
  String arg;
  PatientEssentialsList(this.arg);

  @override
  _PatientEssentialsListState createState() => _PatientEssentialsListState();
}

class _PatientEssentialsListState extends State<PatientEssentialsList> {
  Future<List<Provider>>? _future;

  //API Calls
  Future<List<Provider>> _fetchList(String arg) async{
    final response = await http.post(
      Uri.https(Helper.BASE_URL, "request/$arg/nearby"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'coordinates': [Helper.getLongitude(), Helper.getLatitude()]
      }),
    );

    if(response.statusCode == 200){
      return ListResponse.fromJson(jsonDecode(response.body)).providers;
    }else{
      throw Exception("Failed to fetch list of providers.");
    }
  }

  void _createRequest({required String providerId, required String providerName, required String providerPhone}) async{
    final response = await http.post(
      Uri.https(Helper.BASE_URL, "request/${widget.arg}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'patientId': Helper.getId(),
        'patientName': Helper.getName(),
        'patientPhone': Helper.getPhone(),
        'patientAddress': Helper.getAddress(),
        'area': Helper.getArea(),

        'essential': widget.arg,
        'coordinates': [Helper.getLongitude(), Helper.getLatitude()],

        'providerName': providerName,
        'providerPhone': providerPhone,
        'providerId': providerId
      }),
    );

    if(response.statusCode == 200){
      Helper.goodToast(GenericResponse.fromJson(jsonDecode(response.body)).message);
    }
  }

  @override
  void initState() {
    super.initState();
    _future = _fetchList(widget.arg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arg),
      ),
      body: FutureBuilder<List<Provider>>(
        future: _future,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListScreen(
              list: snapshot.data!,
              createRequest: _createRequest,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}

class ListScreen extends StatelessWidget {
  final List<Provider> list;
  final Function createRequest;

  ListScreen({required this.list, required this.createRequest});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RowWidget(Icons.account_circle, list[index].name),
                RowWidget(Icons.account_circle, list[index].area),
                RowWidget(Icons.account_circle, list[index].phone),
                IconButton(
                  icon: Icon(Icons.open_in_new),
                  onPressed: () => createRequest(
                    providerId: list[index].providerId,
                    providerPhone: list[index].phone,
                    providerName: list[index].name,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ListResponse{
  int code;
  String message;
  List<Provider> providers;

  ListResponse({required this.code, required this.message, required this.providers});

  factory ListResponse.fromJson(Map<String, dynamic> json){
    Iterable providers = json["providers"];
    return ListResponse(
      code: json["code"],
      message: json["message"],
      providers: providers.map<Provider>((modelJson) => Provider.fromJson(modelJson)).toList(),
    );
  }
}