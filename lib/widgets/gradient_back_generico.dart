import 'package:flutter/material.dart';

class GradientBackGenerico extends StatelessWidget {
  double height = 0.0;

  GradientBackGenerico({Key Key, this.height});

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if(height == null){
      height = screenHeight;
    }

    return Container(
      width: screenWidth,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFFf0a500),
                Color(0xFFcf7500)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
          )
      ),
      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              borderRadius: BorderRadius.circular(screenHeight / 2)
          ),
        ),
      ),
    );
  }

}