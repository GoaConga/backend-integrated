import 'package:flutter/material.dart';
import 'package:internsforyou/utils/extentions.dart';

import '../theme/app_decoration.dart';
import '../theme/app_style.dart';
import '../utils/math_utils.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({this.title = 'Next', required this.onPressed, this.isActive = false, Key? key}) : super(key: key);

  final VoidCallback onPressed;
  final bool isActive;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 7.0.hp,
        width: double.infinity,
        //TODO: Get rid of this auto generated shit!!!
        //TODO: Use isActive value to swap color red to grey
        decoration: AppDecoration.textStyleRobotoCondensedbold241,
        child: Center(
          child: Text(
            title,
            //TODO: Get rid of this stupid auto made style
            style: AppStyle.textStyleRobotoCondensedbold241.copyWith(fontSize: getSize(24)),
          ),
        ),
      ),
    );
  }
}
