import 'package:flutter/material.dart';

class TituloCortes extends StatelessWidget{

  String titleCortes;

  TituloCortes(this.titleCortes);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      width: screenWidth,
      height: 50.0,
      /*decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: Colors.black,
            width: 1.0,
            style: BorderStyle.solid
        ),
      ),*/
      margin: EdgeInsets.only(
        top: 30.0,
        bottom: 20.0,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: FittedBox(
          child: Text(
            titleCortes,
            style: const TextStyle(
                fontFamily: "Lato",
                color: Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }

}