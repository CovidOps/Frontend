import 'package:covigenix/ui/custom_widgets/essential_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EssentialGrid extends StatelessWidget {
  final List<EssentialGridModel> list = [
    EssentialGridModel("remdesivir", "Remdesivir", Icons.five_g),
    EssentialGridModel("oxygen", "Medical Oxygen", Icons.five_g),
    EssentialGridModel("plasma", "Plasma", Icons.five_g),
    EssentialGridModel("fabiflu", "Fabiflu", Icons.five_g)
  ];

  final Function onTap;
  EssentialGrid(this.onTap);
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4.0,
      //mainAxisSpacing: 8.0,
      children: List.generate(
        list.length,
            (index) => EssentialCard(
              model: list[index],
              onTap: onTap,
            ),
      ),
    );
  }
}

class EssentialGridModel{
  final String arg, proper;
  final IconData icon;
  EssentialGridModel(this.arg, this.proper, this.icon);
}
