import 'dart:ui';
import 'package:flutter/material.dart';

//TODO: Delete this entire shit!

class ColorConstant {
  static Color whiteA700Cc = fromHex('#ccffffff');
  static Color whiteA70066 = fromHex('#66ffffff');
  static Color gray400 = fromHex('#c4c4c4');
  static Color gray500 = fromHex('#9e9e9e');
  static Color black900 = fromHex('#080808');
  static Color gray800 = fromHex('#424242');
  static Color black90040 = fromHex('#40000000');
  static Color pink600 = fromHex('#e01c47');
  static Color whiteA700 = fromHex('#ffffff');
  static Color gray3002b = fromHex('#2bdedede');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
