import 'package:barberias/barberia/model/photo.dart';
import 'package:barberias/usuario/bloc/bloc_usuario.dart';
import 'package:barberias/usuario/model/user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class ProfilePhotosList extends StatelessWidget {

  UsuarioBloc usuarioBloc;
  User user;
  ProfilePhotosList(@required this.user);

  /*Photo foto = Photo(
      name: "Knuckles Mountains Range",
      description: "Hiking. Water fall hunting. Natural bath",
      urlImage: "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",

  );
  Photo foto2 = Photo(
      name: "Mountains",
      description: "Hiking. Water fall hunting. Natural bath', 'Scenery & Photography",
      urlImage: "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",

  );*/

  @override
  Widget build(BuildContext context) {
    usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Container(
      margin: EdgeInsets.only(
          top: 10.0, left: 10.0, right: 10.0, bottom: 10.0
      ),
      child: StreamBuilder(
          stream: usuarioBloc.myPhotosListStream(user.uid),
          builder: (context, AsyncSnapshot snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator(),);
              case ConnectionState.done:
                return Column(
                  children: usuarioBloc.buildMyPhotos(snapshot.data.documents)
                );
              case ConnectionState.active:
                return Column(
                    children: usuarioBloc.buildMyPhotos(snapshot.data.documents)
                );
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator(),);
              default:
                return Column(
                    children: usuarioBloc.buildMyPhotos(snapshot.data.documents)
                );
            }
          }

      ),
    );
  }
}