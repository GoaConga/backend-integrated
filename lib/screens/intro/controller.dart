import 'package:get/get.dart';
import 'package:internsforyou/screens/intro/model.dart';

import '../../utils/routes/app_routes.dart';

class IntroController extends GetxController {
  Rx<int> silderIndex = 0.obs;

  Rx<IntroModel> introModelObj = IntroModel().obs;

  onTapBottomPrompts() => Get.toNamed(AppRoutes.introSelectionScreen);
}
