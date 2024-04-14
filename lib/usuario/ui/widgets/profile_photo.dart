import 'package:barberias/barberia/model/photo.dart';
import 'package:barberias/usuario/ui/widgets/profile_photo_info.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ProfilePhoto extends StatelessWidget {
  Photo foto;
  bool internet = true;
  ProfilePhoto( this.foto,);
  @override
  Widget build(BuildContext context) {

    final photoCard = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          bottom: 70.0
      ),
      height: 400.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: internet?CachedNetworkImageProvider(foto.urlImage):AssetImage(foto.urlImage)
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.black26,
      ),
    );

    return Stack(
      alignment: Alignment(0.0, 0.85),
      children: <Widget>[
        photoCard,
        ProfilePhotoInfo(foto)
      ],
    );
  }

}