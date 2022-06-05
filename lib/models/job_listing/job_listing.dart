import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/screens/register/views/details_name_view.dart';
import 'package:internsforyou/screens/register/views/details_view.dart';
import 'package:internsforyou/screens/register/views/intern_profficiency_view.dart';
import 'package:internsforyou/screens/register/views/intern_skills_view.dart';
import 'package:internsforyou/screens/register/views/signup_view.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class JobListing {
  late String jobTitle;
  late List<Skills> skillsRequired;
  late String jobDescription;
  late int minPay;
  late int maxPay;
  late int hours;
  late String location;
  late int positionsAvailable;
  late DateTime employmentDuration;
  late String employmentType;
  late int score;

  JobListing({
    this.jobTitle = 'Placeholder Title',
    this.jobDescription = 'Placeholder Description',
    this.score = 0,
  });
}

class SaveDataPage extends StatefulWidget {
  @override
  _SaveDataPageState createState() => _SaveDataPageState();
}

class _SaveDataPageState extends State<SaveDataPage> {
  PickedFile? pickedFile;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Fie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            GestureDetector(
              child: pickedFile != null
                  ? Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 223, 11, 92))),
                      child: kIsWeb
                          ? Image.network(pickedFile!.path)
                          : Image.file(File(pickedFile!.path)))
                  : Container(
                      width: 250,
                      height: 250,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
                      child: Center(
                        child: Text('Click here to pick image from Gallery'),
                      ),
                    ),
              onTap: () async {
                PickedFile? image =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                if (image != null) {
                  setState(() {
                    pickedFile = image;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            Container(
                height: 50,
                child: ElevatedButton(
                  child: Text('Upload file'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: isLoading || pickedFile == null
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                            Get.toNamed(AppRoutes.loginScreen);
                          });
                          ParseFileBase? parseFile;

                          if (kIsWeb) {
                            //Flutter Web
                            parseFile = ParseWebFile(
                                await pickedFile!.readAsBytes(),
                                name: 'image.jpg'); //Name for file is required
                          } else {
                            //Flutter Mobile/Desktop
                            parseFile = ParseFile(File(pickedFile!.path));
                          }
                          await parseFile.save();

                          final save_user = ParseObject('internsforyou')
                            ..set('isCompany', Static_RegisterScreen.isCompamy)
                            ..set(
                                'email',
                                Static_RegisterScreen.emailController.text
                                    .trim())
                            ..set(
                                'password',
                                Static_RegisterScreen.passwordController.text
                                    .trim())
                            ..set(
                                'first_name',
                                Static_NameDetailsScreen
                                    .firstnameController.text
                                    .trim())
                            ..set(
                                'last_name',
                                Static_NameDetailsScreen.lastnameController.text
                                    .trim())
                            ..set(
                                'company',
                                Static_UserDetailsScreen
                                    .firstnameController.text
                                    .trim())
                            ..set(
                                'bio',
                                Static_UserDetailsScreen.bioController.text
                                    .trim())
                            ..set('checkboxes',
                                Static_UserSkillsScreen.skills_checkboxes)
                            ..set('sliderbar',
                                Static_UserSkillScreen.skills_slider)
                            ..set('file', parseFile);
                          await save_user.save();

                          setState(() {
                            isLoading = false;
                            pickedFile = null;
                          });

                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text(
                                'Save file with success on Back4app',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.blue,
                            ));
                        },
                ))
          ],
        ),
      ),
    );
  }
}
