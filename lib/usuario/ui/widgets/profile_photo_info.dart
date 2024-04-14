import 'package:barberias/barberia/model/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ProfilePhotoInfo extends StatelessWidget {

  Photo foto;

  ProfilePhotoInfo(this.foto);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final card = Container(
      width: screenWidth * 0.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 7.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                this.foto.name,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                this.foto.description,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
                ),
              )
            ]
        ),
      )
      );

    return Stack(
      //alignment: Alignment(0.8, 1.25),
      children: <Widget>[
        card
      ],
    );
  }

}