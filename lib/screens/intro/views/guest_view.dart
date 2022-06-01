import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/intro/controller.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';


class GuestViewScreen extends GetView<IntroController> {
  const GuestViewScreen({Key? key}) : super(key: key);

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
                  children: [
                    Container()
                  ],
                ),
                Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: const Image(
                        image: AssetImage('images/cropped_wa.png'),
                        fit: BoxFit.fitHeight
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Would you like to...', style: IFYFonts.introSubheader,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 3),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sign Up'), style: IFYButtons.primaryButton),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Continue Anonymously'), style: IFYButtons.secondaryButton),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
