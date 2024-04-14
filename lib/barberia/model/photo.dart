import 'package:flutter/material.dart';

class Photo {
  String id;
  String name;
  String description;
  String urlImage;

  Photo({
    Key Key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.id
  });
}
