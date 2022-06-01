import 'package:get/instance_manager.dart';
import 'package:internsforyou/screens/login/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => LoginController());
}
