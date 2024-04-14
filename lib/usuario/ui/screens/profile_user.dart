import 'package:barberias/usuario/bloc/bloc_usuario.dart';
import 'package:barberias/usuario/model/user.dart';
import 'package:barberias/usuario/ui/screens/profile_header.dart';
import 'package:barberias/usuario/ui/widgets/profile_photos_list.dart';
import 'package:barberias/widgets/gradient_back_generico.dart';
import 'package:barberias/widgets/title_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class ProfileUser extends StatelessWidget {
  UsuarioBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UsuarioBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.done:
            return Center(child: CircularProgressIndicator(),);

          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.none:
            return showProfileData(snapshot);
          default:
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("No logeado");

      return Stack(
        children: <Widget>[
          GradientBackGenerico(height: 360.0),
          ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text("Usuario no logeado. Haz Login.", textAlign: TextAlign.center,),
              )
            ],
          ),
        ],
      );
    } else{
      print("Usuario logeado");
      var user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl
      );
      return Stack(
        children: <Widget>[
          GradientBackGenerico(height: 300.0),
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 20.0),
            child: TitleHeader(title: "Usuario"),
          ),
          Container(
            margin: EdgeInsets.only(top: 70.0),
            child: ListView(
              children: <Widget>[
                ProfileHeader(user), //User datos
                ProfilePhotosList(user) //User uid
              ],
            ),
          ),
        ],
      );
    }
  }
}
