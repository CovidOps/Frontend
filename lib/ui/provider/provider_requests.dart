import 'package:covigenix/ui/custom_widgets/essential_grid.dart';
import 'package:covigenix/ui/provider/provider_individual.dart';
import 'package:flutter/material.dart';

class ProviderRequestsList extends StatelessWidget {

  void _onEssentialClick(BuildContext context, String arg){
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProviderRequestsIndiv(arg))
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
