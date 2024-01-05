import 'package:flutter/material.dart';

enum ImagePath {
  shop_go;

  String get rawValue => "assets/png/$name.png";
  Widget toPng() {
    return Image.asset(rawValue);
  }
}
