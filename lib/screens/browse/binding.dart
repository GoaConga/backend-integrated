import 'package:get/get.dart';

import 'controller.dart';

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrowseController());
  }
}
