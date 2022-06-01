import 'package:get/get.dart';
import 'package:internsforyou/models/student/student.dart';
import 'package:internsforyou/screens/browse/model.dart';

import '../../utils/routes/app_routes.dart';

class BrowseController extends GetxController {
  Rx<int> silderIndex = 0.obs;

  Rx<BrowseModel> browseModelObj = BrowseModel().obs;

  onTapBottomPrompts() => Get.toNamed(AppRoutes.introSelectionScreen); //TODO: Need updating

  final currentStudent = Student().obs;
}
