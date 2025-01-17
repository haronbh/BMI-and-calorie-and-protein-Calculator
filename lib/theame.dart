import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color primary = Color.fromRGBO(28, 40, 51, 0.8);
Color secondary = Colors.black;
Color primaryButtonColor = Colors.orangeAccent;
Color secondaryButtonColor = HexColor("ff5757");

TextStyle headlines = TextStyle(letterSpacing: 1.0, fontSize: 15, color: HexColor("d3d3d3"));
TextStyle boldNumber = TextStyle(color: HexColor("fbfbfb"), fontWeight: FontWeight.bold, fontSize: 50.0);
TextStyle secondaryButtonColorStyle = TextStyle(color: secondaryButtonColor, fontWeight: FontWeight.bold, fontSize: 46.0);
TextStyle primaryButtonStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.normal, letterSpacing: 1, wordSpacing: 2, color: secondaryButtonColor);
TextStyle resultNumber = TextStyle(color: HexColor("fbfbfb"), fontWeight: FontWeight.bold, fontSize: 80.0, letterSpacing: 0.1);
