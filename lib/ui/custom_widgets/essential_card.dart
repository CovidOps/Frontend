import 'package:covigenix/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

          crossAxisAlignment:CrossAxisAlignment.center,

          children: [

            Image.asset( model.path, fit:BoxFit.fitHeight),
          ],
        ),),
      ),
      onTap: () => onTap(context, model),
    );
  }
}
