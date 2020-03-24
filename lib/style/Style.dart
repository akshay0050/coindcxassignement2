import 'package:flutter/material.dart';

class Style{
  Style._();

  static const String fontName = 'WorkSans';

  static const TextStyle positiveValue = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.green,
  );
  static const TextStyle negativeValue = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.red,
  );

}