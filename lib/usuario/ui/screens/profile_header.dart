import 'package:barberias/usuario/model/user.dart';
import 'package:barberias/usuario/ui/widgets/button_bar.dart';
import 'package:barberias/usuario/ui/widgets/user_infoo.dart';
import 'package:flutter/material.dart';


class ProfileHeader extends StatelessWidget {

  User user;
  ProfileHeader(@required this.user);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          UserInfoo(user),
          ButtonsBar()
        ],
      ),
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("No logeado");
      return Container(margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Center(child: CircularProgressIndicator()),
            Text("No se pudo cargar la información. Vuelve a ingresar.")
          ],),);
    } else {
      print("Logeado");
      print(snapshot.data);
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoUrl);

      return Container(
        child: Column(
          children: <Widget>[
            UserInfoo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }

}