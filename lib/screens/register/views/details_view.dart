import 'package:flutter/material.dart';
import 'package:internsforyou/screens/register/controller.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:get/get.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';

import '../widgets/ify_textfields.dart';

class Static_UserDetailsScreen {
  static final bool isCompany = true;
  static final _formKey = GlobalKey<FormState>();
  static TextEditingController firstnameController = TextEditingController();
  static TextEditingController lastnameController = TextEditingController();
  static TextEditingController bioController = TextEditingController();
}

class UserDetailsScreen extends GetView<RegisterController> {
  UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Form(
              key: Static_UserDetailsScreen._formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                          '${Static_UserDetailsScreen.isCompany ? 'Company' : 'Personal'} Details',
                          style: IFYFonts.introHeader),
                      Container()
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                          child: primaryTextField(
                              '${Static_UserDetailsScreen.isCompany ? 'company' : 'first'} name',
                              '${Static_UserDetailsScreen.isCompany ? 'company' : 'first'} name',
                              false,
                              Static_UserDetailsScreen.firstnameController,
                              TextInputType.text,
                              1,
                              30)),
                      if (!Static_UserDetailsScreen.isCompany)
                        Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                            child: primaryTextField(
                                'last name',
                                'last name',
                                false,
                                Static_UserDetailsScreen.lastnameController,
                                TextInputType.text,
                                1,
                                30)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                          child: primaryTextField(
                              '${Static_UserDetailsScreen.isCompany ? 'company' : 'personal'} bio',
                              'bio',
                              false,
                              Static_UserDetailsScreen.bioController,
                              TextInputType.multiline,
                              5,
                              200)),
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
                            if (Static_UserDetailsScreen._formKey.currentState!
                                .validate()) {
                              if (Static_UserDetailsScreen.isCompany) {
                                Get.toNamed(AppRoutes.userSkillsScreen);
                                debugPrint(
                                    '${Static_UserDetailsScreen.firstnameController.text}\n ${Static_UserDetailsScreen.bioController.text}');
                              } else {
                                debugPrint(
                                    '${Static_UserDetailsScreen.firstnameController.text} ${Static_UserDetailsScreen.lastnameController.text}\n ${Static_UserDetailsScreen.bioController.text}');
                              }
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
}
