import 'package:flutter/material.dart';
import 'package:internsforyou/models/job_listing/job_listing.dart';
import 'package:internsforyou/screens/register/controller.dart';
import 'package:internsforyou/screens/register/widgets/skill_slider.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:get/get.dart';

class Static_UserSkillScreen {
  static final bool isCompany = true;

  static double _C_value = 0;
  static double _java_value = 0;
  static double _python_value = 0;
  static double _php_value = 0;
  static double _CSS_value = 0;
  static List<double> skills_slider = [
    _C_value,
    _java_value,
    _python_value,
    _php_value,
    _CSS_value
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
                    SizedBox(
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                      child: Slider_MyApp(),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SaveDataPage()),
                          );
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

class Slider_MyApp extends StatelessWidget {
  const Slider_MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Slider_bar(title: 'Flutter Demo Home Page'),
    );
  }
}

class Slider_bar extends StatefulWidget {
  const Slider_bar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Slider_bar> createState() => _Slider_bar();
}

class _Slider_bar extends State<Slider_bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color.fromARGB(255, 68, 67, 67),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'C',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Slider(
                    value: Static_UserSkillScreen.skills_slider[0],
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: Static_UserSkillScreen.skills_slider[0].toString() +
                        '%',
                    activeColor: Colors.red,
                    thumbColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        Static_UserSkillScreen.skills_slider[0] = value;
                      });
                    },
                  ),
                  Text(
                    'Java',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Slider(
                    value: Static_UserSkillScreen.skills_slider[1],
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: Static_UserSkillScreen.skills_slider[1].toString() +
                        '%',
                    activeColor: Colors.red,
                    thumbColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        Static_UserSkillScreen.skills_slider[1] = value;
                      });
                    },
                  ),
                  Text(
                    'Python',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Slider(
                    value: Static_UserSkillScreen.skills_slider[2],
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: Static_UserSkillScreen.skills_slider[2].toString() +
                        '%',
                    activeColor: Colors.red,
                    thumbColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        Static_UserSkillScreen.skills_slider[2] = value;
                      });
                    },
                  ),
                  Text(
                    'PHP',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Slider(
                    value: Static_UserSkillScreen.skills_slider[3],
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: Static_UserSkillScreen.skills_slider[3].toString() +
                        '%',
                    activeColor: Colors.red,
                    thumbColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        Static_UserSkillScreen.skills_slider[3] = value;
                      });
                    },
                  ),
                  Text(
                    'CSS',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Slider(
                    value: Static_UserSkillScreen.skills_slider[4],
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: Static_UserSkillScreen.skills_slider[4].toString() +
                        '%',
                    activeColor: Colors.red,
                    thumbColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        Static_UserSkillScreen.skills_slider[4] = value;
                      });
                    },
                  )
                ])));
  }
}
