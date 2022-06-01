import 'package:get/instance_manager.dart';
import 'package:internsforyou/screens/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => HomeController());
}
