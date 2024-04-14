import 'package:barberias/barberia/ui/widgets/card_image_home_list.dart';
import 'package:barberias/barberia/ui/widgets/card_image_cut_home_list.dart';
import 'package:barberias/barberia/ui/widgets/titulo_cortes.dart';
import 'package:barberias/widgets/gradient_back_generico.dart';
import 'package:barberias/widgets/title_header.dart';
import 'package:flutter/material.dart';
import '../widgets/description_home.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackGenerico(height: 250.0),
          Container(
            margin: EdgeInsets.only(top: 40.0, left: 20.0),
            child: TitleHeader(title: "Bienvenido"),
          ),
          Container(
            margin: EdgeInsets.only(top: 60.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                CardImageList(),
                DescriptionHome("Golden Boys BARBERSHOP", "AV. Las Violetas #684-686\nIndenpendencia-Lima"),
                TituloCortes("Cortes Destacados"),
                CardImageCutHomeList(title: "Cortes Destacados"),
                TituloCortes("Cortes Escolares"),
                CardImageCutHomeList(title: "Cortes Escolares"),
                TituloCortes("Cortes Degradados"),
                CardImageCutHomeList(title: "Cortes Degradados"),
                TituloCortes("Cortes con Diseños"),
                CardImageCutHomeList(title: "Cortes con Diseños"),
                TituloCortes("Afeitado de Barba"),
                CardImageCutHomeList(title: "Afeitado de Barba")
              ],
            ),
          ),
        ],
      ),
    );
  }

}