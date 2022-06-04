import 'package:flutter/material.dart';
import 'package:internsforyou/screens/register/controller.dart';
import 'package:internsforyou/screens/register/widgets/skill_widget.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:get/get.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';

class Static_UserSkillsScreen {
  static final bool isCompany = true;

  static bool? C = false;
  static bool? java = false;
  static bool? python = false;
  static bool? php = false;
  static bool? CSS = false;

  static List<bool?> skills_checkboxes = [C, java, python, php, CSS];
}

class UserSkillsScreen extends GetView<RegisterController> {
  UserSkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SkillTile> checkedSkills = [];
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
                    Text('Skills List', style: IFYFonts.introHeader),
                    Container()
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        'Please select any languages or frameworks you have experience with:',
                        style: IFYFonts.inputPreText,
                      ),
                    ),
                    SizedBox(
                      height: 510,
                      child: CheckboxesRoute(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ElevatedButton(
                        child: const Text('Next'),
                        style: IFYButtons.primaryButton,
                        onPressed: () {
                          for (var cSkill in checkedSkills) {
                            if (cSkill.isChecked) {
                              debugPrint(cSkill.skill.skillName);
                            }
                          }
                          Get.toNamed(AppRoutes.userSkillScreen);
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
    );
  }
}

class CheckboxesRoute extends StatefulWidget {
  @override
  Internship_CheckBoxes createState() => Internship_CheckBoxes();
}

class Internship_CheckBoxes extends State<CheckboxesRoute> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: Container(
            height: 420,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white60, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              CheckboxListTile(
                value: Static_UserSkillsScreen.skills_checkboxes[0],
                onChanged: (val) {
                  setState(() {
                    Static_UserSkillsScreen.skills_checkboxes[0] = val;
                  });
                },
                activeColor: Colors.red,
                title: Text("C", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Divider(
                height: 5,
                color: Color.fromARGB(255, 68, 67, 67),
              ),
              CheckboxListTile(
                value: Static_UserSkillsScreen.skills_checkboxes[1],
                onChanged: (val) {
                  setState(() {
                    Static_UserSkillsScreen.skills_checkboxes[1] = val;
                  });
                },
                activeColor: Colors.red,
                title:
                    Text("Java", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Divider(
                height: 5,
                color: Color.fromARGB(255, 68, 67, 67),
              ),
              CheckboxListTile(
                value: Static_UserSkillsScreen.skills_checkboxes[2],
                onChanged: (val) {
                  setState(() {
                    Static_UserSkillsScreen.skills_checkboxes[2] = val;
                  });
                },
                activeColor: Colors.red,
                title: Text("Python",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Divider(
                height: 5,
                color: Color.fromARGB(255, 68, 67, 67),
              ),
              CheckboxListTile(
                value: Static_UserSkillsScreen.skills_checkboxes[3],
                onChanged: (val) {
                  setState(() {
                    Static_UserSkillsScreen.skills_checkboxes[3] = val;
                  });
                },
                activeColor: Colors.red,
                title:
                    Text("PHP", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Divider(
                height: 5,
                color: Color.fromARGB(255, 68, 67, 67),
              ),
              CheckboxListTile(
                value: Static_UserSkillsScreen.skills_checkboxes[4],
                onChanged: (val) {
                  setState(() {
                    Static_UserSkillsScreen.skills_checkboxes[4] = val;
                  });
                },
                activeColor: Colors.red,
                title:
                    Text("CSS", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Divider(
                height: 5,
                color: Color.fromARGB(255, 68, 67, 67),
              ),
            ])),
      )
    ]);
  }
}
