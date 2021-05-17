import 'package:covigenix/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EssentialCard extends StatelessWidget {
  final EssentialGridModel model;
  final Function onTap;
  EssentialCard({required this.model, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(

        color: Colors.black26,
        child: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            Image.asset( model.path, fit:BoxFit.fill),

            Text(model.proper)
          ],
        ),),
      ),
      onTap: () => onTap(context, model),
    );
  }
}
