import 'dart:convert';
import 'package:covigenix/ui/patient/patient_essentials_list.dart';
import 'package:flutter/material.dart';

import '../essential_grid.dart';

class PatientEssentialsHome extends StatelessWidget {

  void _onEssentialClick(BuildContext context, String arg){
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PatientEssentialsList(arg))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EssentialGrid(_onEssentialClick),
    );
  }
}
