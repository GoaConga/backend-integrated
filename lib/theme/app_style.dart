import 'package:flutter/material.dart';

import '../utils/color_constant.dart';
import '../utils/math_utils.dart';

class AppStyle {
  static TextStyle textStyleRobotoCondensedlight20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getSize(20),
    fontFamily: 'Roboto Condensed',
    fontWeight: FontWeight.w300,
  );

  static TextStyle textStyleRobotoCondensedlightitalic18 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getSize(18),
    fontFamily: 'Roboto Condensed',
    fontWeight: FontWeight.w300,
  );

  static TextStyle textStyleRobotoCondensedlight18 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getSize(18),
    fontFamily: 'Roboto Condensed',
    fontWeight: FontWeight.w300,
  );

  static TextStyle textStyleRobotoCondensedbold241 = textStyleRobotoCondensedbold24.copyWith();

  static TextStyle textStyleRobotoCondensedlight24 = textStyleRobotoCondensedbold24.copyWith(fontWeight: FontWeight.w300);

  static TextStyle textStyleRobotoCondensedbold16 = textStyleRobotoCondensedbold24.copyWith(fontSize: getSize(16));

  static TextStyle textStyleRobotoromanbold36 = TextStyle(
    color: ColorConstant.gray800,
    fontSize: getSize(36),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static TextStyle textStyleRobotoCondensedmedium12 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getSize(12),
    fontFamily: 'Roboto Condensed',
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyleRobotoregular14 = textStyleRobotoregular20.copyWith(
    fontSize: getSize(14),
  );

  static TextStyle textStyleRobotoromanmedium18 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getSize(18),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyleRobotoregular20 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getSize(20),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyleRobotoCondensedbold24 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getSize(24),
    fontFamily: 'Roboto Condensed',
    fontWeight: FontWeight.w700,
  );
}
