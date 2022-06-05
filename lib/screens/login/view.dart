import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/browse/views/sign_in.dart';
import 'package:internsforyou/screens/login/controller.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';
import 'widgets/ify_textfields.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Static_LoginScreen {
  static bool isLoggedIn = false;
  static final _formKey = GlobalKey<FormState>();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
}

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Form(
              key: Static_LoginScreen._formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Login', style: IFYFonts.introHeader),
                      Container()
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                          child: primaryTextField(
                              'email address',
                              'example@mail.com',
                              false,
                              Static_LoginScreen.emailController,
                              TextInputType.emailAddress,
                              1,
                              30)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                          child: primaryTextField(
                              'password',
                              'password',
                              true,
                              Static_LoginScreen.passwordController,
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
                          child: const Text('Login'),
                          style: IFYButtons.primaryButton,
                          onPressed: () {
                            if (Static_LoginScreen._formKey.currentState!
                                .validate()) {
                              Static_LoginScreen.isLoggedIn
                                  ? null
                                  : () => doUserLogin();
                              Sign_in_Success.username_pass = Static_LoginScreen
                                  .emailController.text
                                  .trim();
                              debugPrint(
                                  "Username: ${Static_LoginScreen.emailController.text}\nPassword: ${Static_LoginScreen.passwordController.text}");
                              //TODO: Continue if passed
                            } else {
                              debugPrint('false');
                            }
                          },
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.introScreen);
                          }, //TODO: Handle on press
                          child: const Text('Register'),
                          style: IFYButtons.secondaryButton),
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

  void doUserLogin() async {
    final username = Static_LoginScreen.emailController.text.trim();
    final password = Static_LoginScreen.passwordController.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      //showSuccess("User was successfully login!");
      //Sign_in_Success.username_pass = username;
      Static_LoginScreen.isLoggedIn = true;
      debugPrint("User signed in" + Static_LoginScreen.isLoggedIn.toString());
      Get.toNamed(AppRoutes.browseInternScreen);
    } else {
      //showError(response.error!.message);
    }
  }

  static void doUserLogout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();

    if (response.success) {
      //showSuccess("User was successfully logout!");
      Static_LoginScreen.isLoggedIn = false;
      debugPrint("User logged out" + Static_LoginScreen.isLoggedIn.toString());
    } else {
      //showError(response.error!.message);
    }
  }
}
