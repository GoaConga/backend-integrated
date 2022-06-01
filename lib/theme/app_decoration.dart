import 'package:flutter/material.dart';

import '../utils/color_constant.dart';
import '../utils/math_utils.dart';


class AppDecoration {
  static BoxDecoration get groupStylegray800 => BoxDecoration(color: ColorConstant.gray800);

  static BoxDecoration get textStyleRobotoCondensedlight20 => BoxDecoration(
        color: ColorConstant.whiteA700Cc,
        borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
      );

  static BoxDecoration get groupStylegray3002bcornerRadius => BoxDecoration(
        color: ColorConstant.gray3002b,
        borderRadius: BorderRadius.circular(getHorizontalSize(29.00)),
      );

  static BoxDecoration get groupStylegray400cornerRadius => BoxDecoration(
        color: ColorConstant.gray400,
        borderRadius: BorderRadius.circular(getHorizontalSize(70.50)),
      );

  static BoxDecoration get groupStylepink1 => BoxDecoration(
        color: ColorConstant.pink600,
        borderRadius: BorderRadius.circular(getHorizontalSize(70.50)),
      );

  static BoxDecoration get textStyleRobotoCondensedbold241 => BoxDecoration(
        color: ColorConstant.pink600,
        borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
      );

  static BoxDecoration get groupStylewhiteA700cornerRadius => BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(getHorizontalSize(29.00)),
      );

  static BoxDecoration get textStyleRobotoCondensedlight24 => BoxDecoration(
        color: ColorConstant.gray500,
        borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
      );

  static BoxDecoration get textStyleRobotoCondensedbold16 => BoxDecoration(
        color: ColorConstant.pink600,
        borderRadius: BorderRadius.circular(getHorizontalSize(25.00)),
        border: Border.all(color: ColorConstant.whiteA700, width: getHorizontalSize(1.00)),
      );

  static BoxDecoration get groupStylepink600 => BoxDecoration(color: ColorConstant.pink600);

  static BoxDecoration get groupStylewhiteA70066cornerRadius => BoxDecoration(
        color: ColorConstant.whiteA70066,
        borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90040,
            spreadRadius: getHorizontalSize(2.00),
            blurRadius: getHorizontalSize(2.00),
            offset: const Offset(0, 4),
          ),
        ],
      );

  static BoxDecoration get groupStylepink600cornerRadius => BoxDecoration(
        color: ColorConstant.pink600,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getHorizontalSize(10.00)),
          topRight: Radius.circular(getHorizontalSize(10.00)),
          bottomLeft: Radius.circular(getHorizontalSize(20.00)),
          bottomRight: Radius.circular(getHorizontalSize(20.00)),
        ),
      );
}
