import 'dart:convert';
import 'package:covigenix/helper.dart';
import 'package:covigenix/ui/patient/patient_essentials_list.dart';
import 'package:covigenix/ui/patient/patient_hardcoded_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../custom_widgets/essential_grid.dart';

class PatientEssentialsHome extends StatelessWidget {

  void _onEssentialClick(BuildContext context, EssentialGridModel model){
    Future.delayed(const Duration(milliseconds: 500), () async{
      if(model.arg == "oxygen"){
        if(await canLaunch(Helper.OXYGEN_URL)){
          await launch(Helper.OXYGEN_URL);
        }else{
          Helper.goodToast('Opening web links is not supported on your phone');
        }
      } else if(model.arg == "ambulance"){
        if(await canLaunch(Helper.AMBULANCE_URL)){
          await launch(Helper.AMBULANCE_URL);
        }else{
          Helper.goodToast('Opening web links is not supported on your phone');
        }
      } else if(model.arg == "icu"){
        if(await canLaunch(Helper.ICU_URL)){
          await launch(Helper.ICU_URL);
        }else{
          Helper.goodToast('Opening web links is not supported on your phone');
        }
      }else if(model.arg == "hospital") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PatientHardcodedList()));
      }else{
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PatientEssentialsList(model)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EssentialGrid(_onEssentialClick),
    );
  }
}
