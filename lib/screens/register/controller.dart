import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/state_manager.dart';

class RegisterController extends GetxController {
  final basicDetailsKey = GlobalKey<FormBuilderState>();
  final signupDetailsKey = GlobalKey<FormBuilderState>();

  RxDouble pageIndex = 1.0.obs;
}
