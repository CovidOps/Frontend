import 'dart:convert';

import 'package:covigenix/ui/custom_widgets/icons.dart';
import 'package:covigenix/ui/custom_widgets/progress.dart';
import 'package:covigenix/ui/custom_widgets/row_widget.dart';
import 'package:covigenix/ui/model/generic_response.dart';
import 'package:covigenix/ui/model/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../helper.dart';

class ProviderRequestsIndiv extends StatefulWidget {
  final EssentialGridModel model;

  ProviderRequestsIndiv(this.model);

  @override
  _ProviderRequestsIndivState createState() => _ProviderRequestsIndivState();
}

class _ProviderRequestsIndivState extends State<ProviderRequestsIndiv> {
  Future<List<Patient>>? _future;
  bool isLoading = false;

  //API Calls
  Future<List<Patient>> _fetchList() async {
    final response = await http.get(
      Uri.https(Helper.BASE_URL,
          "request/provider/${Helper.getId()}/${widget.model.arg}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return ListResponse.fromJson(jsonDecode(response.body)).requests;
    } else {
      throw Exception("Failed to fetch list of requests.");
    }
  }

  void _getApproval({required String requestId}) async {
    final response = await http.get(
      Uri.https(Helper.BASE_URL, "request/approval/$requestId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      GenericResponse res = GenericResponse.fromJson(jsonDecode(response.body));
      Helper.goodToast(res.message);
    }
  }

  @override
  void initState() {
    super.initState();
    _future = _fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.proper),
      ),
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
            child: Opacity(
              opacity: 0.2,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset("assets/images/back1.jpg", fit: BoxFit.cover,)),
              )),
        ),
        FutureBuilder<List<Patient>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  ListScreen(
                    list: Helper.sortListPatient(snapshot.data!),
                    getApproval: _getApproval,
                  ),
                  (isLoading ? CustomProgressIndicator() : Container()),
                ],
              );
            }
            return CustomProgressIndicator();
          },
        ),
      ]),
    );
  }
}

class ListScreen extends StatelessWidget {
  final List<Patient> list;
  final Function getApproval;

  ListScreen({required this.list, required this.getApproval});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RowWidget(Icons.account_circle, list[index].name),
                      RowWidget(Icons.business_outlined, list[index].area),
                      //RowWidget(Icons.phone, list[index].phone),
                      RowWidget(Icons.api_rounded, list[index].address),
                      (list[index].address == "Not available"
                          ? IconButton(
                              icon: Icon(Icons.open_in_new),
                              onPressed: () => getApproval(
                                requestId: list[index].requestId,
                              ),
                            )
                          : Container()),
                    ],
                  ),
                ),
                CallIcon(list[index].phone),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ListResponse {
  int code;
  String message;
  List<Patient> requests;

  ListResponse(
      {required this.code, required this.message, required this.requests});

  factory ListResponse.fromJson(Map<String, dynamic> json) {
    Iterable requests = json["requests"];
    return ListResponse(
      code: json["code"],
      message: json["message"],
      requests: requests
          .map<Patient>((modelJson) => Patient.fromJson(modelJson))
          .toList(),
    );
  }
}
