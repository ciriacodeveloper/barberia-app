import 'package:barberias/usuario/model/user.dart';
import 'package:flutter/material.dart';

class UserInfoo extends StatelessWidget {

  User user;

  UserInfoo(@required this.user);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


    return FittedBox(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: <Widget>[
            Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                        style: BorderStyle.solid
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(user.photoURL)
                    )
                )
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'Lato',
                    )
                ),

                Text(
                    user.email,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic, //esto es para poner las palabras en cursiva
                        fontFamily: 'Lato'
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}