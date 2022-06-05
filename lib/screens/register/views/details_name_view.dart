import 'package:flutter/material.dart';
import 'package:internsforyou/screens/register/controller.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:get/get.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';

import '../widgets/ify_textfields.dart';

class Static_NameDetailsScreen {
  static final bool isCompany = true;
  static final _formKey = GlobalKey<FormState>();
  static TextEditingController firstnameController = TextEditingController();
  static TextEditingController lastnameController = TextEditingController();
}

class NameDetailsScreen extends GetView<RegisterController> {
  NameDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Form(
              key: Static_NameDetailsScreen._formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                          '${Static_NameDetailsScreen.isCompany ? 'Company' : 'Personal'} Details',
                          style: IFYFonts.introHeader),
                      Container()
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                          child: primaryTextField(
                              '${Static_NameDetailsScreen.isCompany ? 'company' : 'first'} name',
                              '${Static_NameDetailsScreen.isCompany ? 'company' : 'first'} name',
                              false,
                              Static_NameDetailsScreen.firstnameController,
                              TextInputType.text,
                              1,
                              30)),
                      if (!Static_NameDetailsScreen.isCompany)
                        Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                            child: primaryTextField(
                                'last name',
                                'last name',
                                false,
                                Static_NameDetailsScreen.firstnameController,
                                TextInputType.text,
                                1,
                                30)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                          child: primaryTextField(
                              '${Static_NameDetailsScreen.isCompany ? 'company' : 'personal'} bio',
                              'bio',
                              false,
                              Static_NameDetailsScreen.lastnameController,
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
                            if (Static_NameDetailsScreen._formKey.currentState!
                                .validate()) {
                              if (Static_NameDetailsScreen.isCompany) {
                                Get.toNamed(AppRoutes.detailsFormScreen);
                                debugPrint(
                                    '${Static_NameDetailsScreen.firstnameController.text}\n ${Static_NameDetailsScreen.lastnameController.text}');
                              } else {
                                debugPrint(
                                    '${Static_NameDetailsScreen.firstnameController.text} ${Static_NameDetailsScreen.lastnameController.text}\n ${Static_NameDetailsScreen.lastnameController.text}');
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
