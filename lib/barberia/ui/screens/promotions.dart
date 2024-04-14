import 'package:barberias/barberia/ui/widgets/prueba_promotions.dart';
import 'package:barberias/widgets/gradient_back_generico.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Promotions extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Promotions();
  }
}

class _Promotions extends State<Promotions>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackGenerico(height: 250.0),
          PruebaPromotions(),
        ],
      ),
    );
  }

}