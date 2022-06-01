import 'package:flutter/material.dart';
import 'package:internsforyou/utils/extentions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator(
    this.pageNo, {
    Key? key,
  }) : super(key: key);

  final double pageNo;

  @override
  Widget build(BuildContext context) {
    return SmoothIndicator(
      offset: pageNo,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: ScrollingDotsEffect(
        spacing: 10,
        activeDotColor: Colors.white,
        dotColor: Colors.grey,
        dotHeight: 1.5.hp,
        // dotWidth: 3.0.wp,
        activeDotScale: 1.4,
      ),
    );
  }
}
