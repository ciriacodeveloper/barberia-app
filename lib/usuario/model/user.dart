import 'package:barberias/barberia/model/photo.dart';
import 'package:flutter/material.dart';

class User{
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Photo> myPhotos;
  final List<Photo> myFavoritePhotos;


  User({
    Key Key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myPhotos,
    this.myFavoritePhotos
});
}