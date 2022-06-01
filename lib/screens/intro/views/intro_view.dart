import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/intro/controller.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';

class IntroScreen extends GetView<IntroController> {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [Container()],
                    ),
                    Column(
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: const Image(
                              image: AssetImage('images/cropped_wa.png'),
                              fit: BoxFit.fitHeight),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Interns For You',
                            style: IFYFonts.introHeader,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Creating connections...',
                            style: IFYFonts.introSubheader,
                          ),
                        )
                      ],
                    ),
                    Column()
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: const Text('skip'),
                        style: IFYButtons.textButton,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.browseInternScreen);
                        },
                        child: const Text('next'),
                        style: IFYButtons.textButton,
                      ),
                    ],
                  ),
                ))));
  }
}
