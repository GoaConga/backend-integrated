import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/intro/model.dart';

import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';

class ItemModelWidget extends StatelessWidget {
  const ItemModelWidget(this.itemModel, {required this.onPressed, Key? key}) : super(key: key);

  final VoidCallback onPressed;
  final IntroItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: getVerticalSize(159.00),
        width: getHorizontalSize(337.00),
        decoration: BoxDecoration(
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
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: const EdgeInsets.all(0),
          color: ColorConstant.whiteA70066,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: onPressed,
                  child: Image.asset(
                    ImageConstant.kImgCompany,
                    height: getVerticalSize(159.00),
                    width: getHorizontalSize(337.00),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(16.00),
                    top: getVerticalSize(68.00),
                    right: getHorizontalSize(16.00),
                    bottom: getVerticalSize(68.00),
                  ),
                  child: Text(
                    "msg_looking_for_an".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.textStyleRobotoregular20.copyWith(
                      fontSize: getSize(
                        20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
