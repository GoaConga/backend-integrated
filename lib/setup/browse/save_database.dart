import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:internsforyou/setup/setup_main.dart';

class Save_User_Signup_Data {
  //static late String prof_username;
  static late bool prof_is_intern;
  static late String prof_username;
  static late String prof_email;
  static late String prof_password;
  static late String prof_company;
  static late String prof_bio;
  static late String prof_internship;
  static late String prof_description;
  static late bool? prof_C;
  static late bool? prof_java;
  static late bool? prof_python;
  static late bool? prof_php;
  static late bool? prof_CSS;
  static late double prof_C_value;
  static late double prof_java_value;
  static late double prof_python_value;
  static late double prof_php_value;
  static late double prof_CSS_value;
  static late String prof_database_name;
}

class DisplaySaveGalleryPage extends StatefulWidget {
  @override
  _DisplaySaveHomePageState createState() => _DisplaySaveHomePageState();
}

class _DisplaySaveHomePageState extends State<DisplaySaveGalleryPage> {
  PickedFile? pickedFile;

  List<ParseObject> results = <ParseObject>[];
  double selectedDistance = 3000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            child: ElevatedButton(
              child: Text('Upload File and Finalise'),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaveDataPage()),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

class SaveDataPage extends StatefulWidget {
  @override
  _SaveDataPageState createState() => _SaveDataPageState();
}

class _SaveDataPageState extends State<SaveDataPage> {
  final bool is_intern = Save_User_Signup_Data.prof_is_intern;
  final String username = Save_User_Signup_Data.prof_username;
  final String email = Save_User_Signup_Data.prof_email;
  final String password = Save_User_Signup_Data.prof_password;
  final String company = Save_User_Signup_Data.prof_company;
  final String bio = Save_User_Signup_Data.prof_bio;
  final String internship = Save_User_Signup_Data.prof_internship;
  final String description = Save_User_Signup_Data.prof_description;
  final bool? C = Save_User_Signup_Data.prof_C;
  final bool? java = Save_User_Signup_Data.prof_java;
  final bool? python = Save_User_Signup_Data.prof_python;
  final bool? php = Save_User_Signup_Data.prof_php;
  final bool? CSS = Save_User_Signup_Data.prof_CSS;
  final int C_val = Save_User_Signup_Data.prof_C_value.toInt();
  final int java_val = Save_User_Signup_Data.prof_java_value.toInt();
  final int python_val = Save_User_Signup_Data.prof_python_value.toInt();
  final int php_val = Save_User_Signup_Data.prof_php_value.toInt();
  final int CSS_val = Save_User_Signup_Data.prof_CSS_value.toInt();
  final String _database_name = Save_User_Signup_Data.prof_database_name;

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
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => sign_it_in()));
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

                          final gallery = ParseObject(_database_name)
                            ..set('intern', is_intern)
                            ..set('username', username)
                            ..set('email', email)
                            ..set('password', password)
                            ..set('company', company)
                            ..set('file', parseFile)
                            ..set('bio', bio)
                            ..set('internship', internship)
                            ..set('description', description)
                            ..set('C', C)
                            ..set('java', java)
                            ..set('python', python)
                            ..set('php', php)
                            ..set('CSS', CSS)
                            ..set('C_value', C_val)
                            ..set('java_value', java_val)
                            ..set('python_value', python_val)
                            ..set('php_value', php_val)
                            ..set('CSS_value', CSS_val);
                          await gallery.save();

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
