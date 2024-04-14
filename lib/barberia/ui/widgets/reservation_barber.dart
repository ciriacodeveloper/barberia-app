import 'package:barberias/barberia/ui/widgets/profile_barber_nosotros.dart';
import 'package:barberias/widgets/gradient_back_generico.dart';
import 'package:barberias/widgets/title_header.dart';
import 'package:flutter/material.dart';

class ReservationBarber extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReservationBarber();
  }
}

class _ReservationBarber extends State<ReservationBarber>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackGenerico(height: 250.0,),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: SizedBox(height: 50.0, width: 50.0,
                    child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,),
                      onPressed: (){Navigator.pop(context);},
                    ),
                  ),
                ),
                Flexible(child: Container(
                  child: TitleHeader(title: "Elige a tu barbero"),
                ),
                )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 80),
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(padding: EdgeInsets.all(20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(flex: 1,
                                child: Container(margin: EdgeInsets.only(right: 10.0,), width: 100.0, height: 100.0, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/corte_colita.png")),
                                    boxShadow: <BoxShadow>[BoxShadow(color: Colors.black, blurRadius: 10.0, offset: Offset(0.0, 7.0))]),
                                  child: FlatButton(child: null,
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            ProfileBarberNosotros(
                                              nameBarber: "Sergio Benahavente",
                                              title: "Sergio Benahavente",
                                              pathImage: "assets/images/corte_degradado.jpg",
                                              height: 320.0,
                                              width: 340.0,
                                              top: 0.0, bottom: 0.0, left: 0.0,
                                            )),
                                      );
                                    },),),
                              ),
                              Expanded(flex: 2, child: FlatButton(child: Text("Sergio Benahavente",textAlign: TextAlign.left, style: TextStyle(fontFamily: "Lato", fontSize: 20.0, color: Colors.black)),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        ProfileBarberNosotros(
                                          nameBarber: "Sergio Benahavente",
                                          title: "Sergio Benahavente",
                                          pathImage: "assets/images/corte_degradado.jpg",
                                          height: 320.0,
                                          width: 340.0,
                                          top: 0.0, bottom: 0.0, left: 0.0,
                                        )),
                                  );
                                },
                              )),
                            ],),
                        ),

                        Divider(height: 10, thickness: 1, color: Colors.grey, endIndent: 20, indent: 0,),

                        Container(padding: EdgeInsets.all(20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(flex: 1,
                                child: Container(margin: EdgeInsets.only(right: 10.0,), width: 100.0, height: 100.0, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/corte_colita.png")),
                                    boxShadow: <BoxShadow>[BoxShadow(color: Colors.black, blurRadius: 10.0, offset: Offset(0.0, 7.0))]),
                                  child: FlatButton(child: null,
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            ProfileBarberNosotros(
                                              nameBarber: "Pepe Timoteo",
                                              title: "Pepe Timoteo",
                                              pathImage: "assets/images/corte_cachetada.jpg",
                                              height: 320.0,
                                              width: 340.0,
                                              top: 10.0, bottom: 0.0, left: 20.0,
                                            )),
                                      );
                                    },),),
                              ),
                              Expanded(flex: 2, child: FlatButton(child: Text("Pepe Timoteo",textAlign: TextAlign.left, style: TextStyle(fontFamily: "Lato", fontSize: 20.0, color: Colors.black)),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        ProfileBarberNosotros(
                                          nameBarber: "Pepe Timoteo",
                                          title: "Pepe Timoteo",
                                          pathImage: "assets/images/corte_cachetada.jpg",
                                          height: 320.0,
                                          width: 340.0,
                                          top: 10.0, bottom: 0.0, left: 20.0,
                                        )),
                                  );
                                },
                              ))
                            ],),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}