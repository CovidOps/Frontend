import 'dart:convert';
import 'dart:core';
import 'package:covigenix/ui/custom_widgets/row_widget.dart';
import 'package:covigenix/ui/model/generic_response.dart';
import 'package:covigenix/ui/model/my_request_model.dart';
import 'package:covigenix/helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyRequests extends StatefulWidget {
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {

  Future<List<MyRequestModel>>? _future;

  @override
  void initState() {
    super.initState();

    String id = Helper.getId();
    print(id);
    _future = getMyRequests(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MyRequestModel>>(
      future: _future,
      builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListScreen(
              list: snapshot.data!,
              shareAddress: _shareAddress,
              deleteRequest: _deleteRequest,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
    );
  }

  //API Calls
  Future<List<MyRequestModel>> getMyRequests(String id) async{
    final response = await http.get(
      Uri.https(Helper.BASE_URL, "request/patient/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode == 200){
      Response res = Response.fromJson(jsonDecode(response.body));
      //Helper.goodToast(res.message!);
      return res.requests!;
    }
    else
      throw Exception('Failed to create patient');
  }

  void _shareAddress(String reqId) async{
    final response = await http.post(
      Uri.https(Helper.BASE_URL, "request/share-address/$reqId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode == 200){
      GenericResponse res = GenericResponse.fromJson(jsonDecode(response.body));
      Helper.goodToast(res.message);

      setState(() {
        _future = getMyRequests(Helper.getId());
      });
    }
  }

  void _deleteRequest(String reqId) async{
    final response = await http.delete(
      Uri.https(Helper.BASE_URL, "request/$reqId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode == 200){
      GenericResponse res = GenericResponse.fromJson(jsonDecode(response.body));
      Helper.goodToast(res.message);

      setState(() {
        _future = getMyRequests(Helper.getId());
      });
    }
  }
}

class ListScreen extends StatelessWidget {
  final List<MyRequestModel> list;
  final Function shareAddress, deleteRequest;

  ListScreen({required this.list, required this.shareAddress, required this.deleteRequest});

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
                RowWidget(Icons.account_circle, list[index].provider_name),
                RowWidget(Icons.account_circle, list[index].provider_phone),
                RowWidget(Icons.account_circle, list[index].essential),
                IconButton(icon: Icon(Icons.delete), onPressed: () => deleteRequest(list[index].id)),
                (list[index].sought_approval && (!list[index].approved)
                    ? ElevatedButton(
                    onPressed: () => shareAddress(list[index].id),
                    child: Text("Share Address"))
                    : Container()),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Response {
  int code;
  String message;
  List<MyRequestModel>? requests;

  Response({required this.code, required this.message, this.requests});

  factory Response.fromJson(Map<String, dynamic> json){
    Iterable requests = json["requests"];
    return Response(
        code: json["code"],
        message: json["message"],
        requests: requests.map<MyRequestModel>((modelJson) => MyRequestModel.fromJson(modelJson)).toList()
    );
  }
}