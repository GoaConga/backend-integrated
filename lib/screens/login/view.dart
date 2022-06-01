import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/login/controller.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'widgets/ify_textfields.dart';

class Static_LoginScreen {
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
                          onPressed: () {}, //TODO: Handle on press
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
}
