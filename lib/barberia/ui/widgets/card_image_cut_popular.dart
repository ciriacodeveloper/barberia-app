import 'package:flutter/material.dart';

class CardImageCutPopular extends StatefulWidget{
  final VoidCallback onPressed;
  String pathImage;
  String name;
  CardImageCutPopular(@required this.onPressed, this.pathImage, this.name);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardImageCutPopular();
  }
}

class _CardImageCutPopular extends State<CardImageCutPopular>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[

        FittedBox(
          child: Container(
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            width: MediaQuery.of(context).size.width*0.43,
            height: 150.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill, // esto es para encuadrar la imgaen al centro
                image: AssetImage(widget.pathImage) //aqui insertamos la imagen
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: <BoxShadow>[  //esto es para agregar una sombra
                BoxShadow(
                color: Colors.black38, //el color de la sombra
                blurRadius: 10.0,     //que tan degradado quieres
                offset: Offset(0.0, 4.0) //la posicion de la sombra en X y Y
                )
              ]
            ),
            child: FlatButton(child: null,
            onPressed: widget.onPressed,
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(
              top: 10.0
          ),
          child: Text(
            widget.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 13.0,
                fontWeight: FontWeight.bold
            ),
          ),
        )

      ],
    );
  }

}
