import 'package:flutter/material.dart';
import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/screens/register/controller.dart';
import 'package:internsforyou/screens/register/widgets/skill_slider.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:get/get.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';

import '../widgets/ify_textfields.dart';

class Static_UserSkillScreen {
  static final bool isCompany = true;

  static List<Skills> skills = [
    Skills(skillName: 'java'),
    Skills(skillName: 'javascript'),
    Skills(skillName: 'C#'),
    Skills(skillName: 'C++'),
    Skills(skillName: 'Flutter'),
    Skills(skillName: 'Doobers'),
    Skills(skillName: 'Laravel'),
    Skills(skillName: 'Dart'),
    Skills(skillName: 'SQL'),
    Skills(skillName: 'HTML'),
    Skills(skillName: 'CSS'),
    Skills(skillName: 'bootstrap'),
  ];
}

class UserSkillScreen extends GetView<RegisterController> {
  UserSkillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SkillSlider> checkedSkills = [];
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
                    Text('Skills Proficiency', style: IFYFonts.introHeader),
                    Container()
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        'How proficient do you feel about your selected skills?',
                        style: IFYFonts.inputPreText,
                      ),
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(400),
                      child: ListView.builder(
                          clipBehavior: Clip.hardEdge,
                          itemCount: Static_UserSkillScreen.skills.length,
                          itemBuilder: (BuildContext context, index) {
                            SkillSlider _ = SkillSlider(
                                skill: Static_UserSkillScreen.skills[index]);
                            checkedSkills.add(_);
                            return _;
                          }),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ElevatedButton(
                        child: const Text('Next'),
                        style: IFYButtons.primaryButton,
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
