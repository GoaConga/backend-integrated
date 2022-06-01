import 'package:get/get.dart';

import 'controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
  }
}
