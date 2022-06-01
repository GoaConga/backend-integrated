import 'package:flutter/material.dart';

Size size = WidgetsBinding.instance!.window.physicalSize / WidgetsBinding.instance!.window.devicePixelRatio;

//TODO: All of this stuff is useless you can use the extentions instead. Delete this

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) => px * (size.width / 360);

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  num statusBar = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).viewPadding.top;
  num screenHeight = size.height - statusBar;
  return px * (screenHeight / 640);
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  return height < width ? height.toInt().toDouble() : width.toInt().toDouble();
}
