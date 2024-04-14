import 'package:barberias/widgets/gradient_back_generico.dart';
import 'package:barberias/widgets/title_header.dart';
import 'package:flutter/material.dart';

class Reservation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackGenerico(height: 250.0),
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 20.0),
            child: TitleHeader(title: "Mis reservas"),
          ),
        ],
      ),
    );
  }

}