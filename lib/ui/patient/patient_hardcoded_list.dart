import 'dart:convert';
import 'package:covigenix/ui/custom_widgets/icons.dart';
import 'package:covigenix/ui/custom_widgets/progress.dart';
import 'package:covigenix/ui/custom_widgets/row_widget.dart';
import 'package:covigenix/ui/model/provider_model.dart';
import 'package:flutter/material.dart';

import '../../helper.dart';

class PatientHardcodedList extends StatefulWidget {

  @override
  _PatientHardcodedListState createState() => _PatientHardcodedListState();
}

class _PatientHardcodedListState extends State<PatientHardcodedList> {

  bool isLoading = true;
  late List<HospitalListModel> master;
  List<HospitalListModel> filtered = List.empty(growable: true);
  final List<String> states = Helper.getStates();
  String? dropdownValue = null;

  //API Calls
  @override
  void initState(){
    super.initState();
    loadList();
  }

  List<HospitalListModel> filterData(String state){
    return master.where((item) => item.State == state).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Hospitals', style: TextStyle(fontSize: 24),)),
        ),
        body: Stack(
          children: [
            //Container(color: Colors.white),
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
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    //color: Colors.blue.shade100,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text("Select state"),
                      value: dropdownValue,
                      items: states.map((item) => DropdownMenuItem<String>(value: item, child: Text(item))).toList(),
                      onChanged: (newVal) => setState((){
                        dropdownValue = newVal!;
                        filtered = filterData(newVal);
                      }),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RowWidget(Icons.account_circle, "Provider: ${filtered[index].Name}"),
                                RowWidget(Icons.business_outlined, "Area: ${filtered[index].Area}"),
                                Divider(color: Colors.grey.shade400, thickness: 0, indent: 0, endIndent: 0, height: 0),
                                //RowWidget(Icons.phone, list[index].phone),
                              ],
                            ),
                          );
                        },
                      ),
                  )
                ],
              )
            ),
          ],
        )
    );
  }

  void loadList() async{
    master = await Helper.getHospitalsFromJson();
    setState(() {
      isLoading = false;
    });
  }
}