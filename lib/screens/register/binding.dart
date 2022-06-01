import 'package:get/instance_manager.dart';
import 'package:internsforyou/screens/register/controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => RegisterController());
}
