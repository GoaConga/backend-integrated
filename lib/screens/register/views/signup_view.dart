import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/register/controller.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../widgets/ify_textfields.dart';

class Static_RegisterScreen {
  static final bool isCompamy = true;
  static final _formKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController password2Controller = TextEditingController();
}

class RegisterScreen extends GetView<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Form(
              key: Static_RegisterScreen._formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                          '${Static_RegisterScreen.isCompamy ? 'Company' : 'Personal'} Account Details',
                          style: IFYFonts.introHeader),
                      Container()
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                          child: primaryTextField(
                              '${Static_RegisterScreen.isCompamy ? 'company' : 'personal'} email address',
                              'example@mail.com',
                              false,
                              Static_RegisterScreen.emailController,
                              TextInputType.emailAddress,
                              1,
                              30)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                          child: primaryTextField(
                              'password',
                              'password',
                              true,
                              Static_RegisterScreen.passwordController,
                              TextInputType.visiblePassword,
                              1,
                              30)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                          child: primaryTextField(
                              're-type password',
                              'password',
                              true,
                              Static_RegisterScreen.password2Controller,
                              TextInputType.visiblePassword,
                              1,
                              30)),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: ElevatedButton(
                          child: const Text('Create Account'),
                          style: IFYButtons.primaryButton,
                          onPressed: () {
                            if (Static_RegisterScreen._formKey.currentState!
                                .validate()) {
                              doUserRegistration();
                              debugPrint(
                                  "Username: ${Static_RegisterScreen.emailController.text}\nPassword: ${Static_RegisterScreen.passwordController.text}");
                              //TODO: Continue if passed
                            } else {
                              debugPrint('false');
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void doUserRegistration() async {
    final username = Static_RegisterScreen.emailController.text.trim();
    final email = Static_RegisterScreen.emailController.text.trim();
    final password = Static_RegisterScreen.passwordController.text.trim();

    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();

    if (response.success) {
      //showSuccess();
      Get.toNamed(AppRoutes.userSkillsScreen);
    } else {
      //showError(response.error!.message);
      debugPrint('email exists');
    }
  }
}
