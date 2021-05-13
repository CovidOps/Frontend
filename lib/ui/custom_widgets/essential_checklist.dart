import 'package:covigenix/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EssentialChecklist extends StatefulWidget{
  final Map<String, bool> status = Map<String, bool>();
  EssentialChecklist();

  @override
  _EssentialChecklistState createState() => _EssentialChecklistState();
}
class _EssentialChecklistState extends State<EssentialChecklist> {

  final List<EssentialGridModel> list = Helper.essentialsList;

  _EssentialChecklistState();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index){
        return CheckboxListTile(
          value: list[index].checked,
          title: Text(list[index].proper),
          onChanged: (bool? val) => setState(() {
            list[index].checked = val!;
            widget.status[list[index].arg] = val!;
          }),
        );
      }
    );
  }
}
