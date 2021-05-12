import 'dart:collection';
import 'package:covigenix/ui/model/my_request_model.dart';
import 'package:covigenix/helper.dart';
import 'package:flutter/material.dart';

class MyRequests extends StatefulWidget {
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  late List<MyRequestModel> list;
  HashMap<int, String> map = Helper.createMap();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //list = List.filled(0, MyRequestModel());
    list = List.empty(growable: true);
    MyRequestModel model = MyRequestModel();
    model.provider_name = "PAPA";
    model.isRequested = true;
    list.add(model);
    model.provider_name = "CHAPPA";
    model.provider_phone = "7809601401";
    list.add(model);
  }

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
                RowWidget(Icons.account_circle, map[list[index].essentials_id]!),
                (list[index].isRequested && (!list[index].isShared) ? ElevatedButton(onPressed: () => _shareAddress(list[index].id), child: Text("Share Address")) : Container()),
              ],
            ),
          );
        },
      ),
    );
  }

  void _shareAddress(String reqId){

  }
}

class RowWidget extends StatelessWidget {
  IconData icon;
  String str;

  RowWidget(this.icon, this.str);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [Icon(icon), Text(str)],
      ),
    );
  }
}
