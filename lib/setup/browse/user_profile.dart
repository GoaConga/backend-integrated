import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class User_Value_Setter {
  //static late String prof_username;
  static late String prof_email;
  static late String prof_company;
  static late ParseFileBase prof_logo;
  static late String prof_bio;
  static late String prof_internship;
  static late String prof_description;
  static late bool prof_C;
  static late bool prof_java;
  static late bool prof_python;
  static late bool prof_php;
  static late bool prof_CSS;
  static late int profC_value;
  static late int profjava_value;
  static late int profpython_value;
  static late int profphp_value;
  static late int profCSS_value;
}

class Search_Profile extends StatefulWidget {
  @override
  _SearchProfileState createState() => _SearchProfileState();
}

class _SearchProfileState extends State<Search_Profile> {
  //final String username = Something.prof_username;
  final String email = User_Value_Setter.prof_email;
  final String company = User_Value_Setter.prof_company;
  final ParseFileBase logo = User_Value_Setter.prof_logo;
  final String bio = User_Value_Setter.prof_bio;
  final String internship = User_Value_Setter.prof_internship;
  final String description = User_Value_Setter.prof_description;
  final bool C = User_Value_Setter.prof_C;
  final bool java = User_Value_Setter.prof_java;
  final bool python = User_Value_Setter.prof_python;
  final bool php = User_Value_Setter.prof_php;
  final bool CSS = User_Value_Setter.prof_CSS;
  final int C_val = User_Value_Setter.profC_value;
  final int java_val = User_Value_Setter.profjava_value;
  final int python_val = User_Value_Setter.profpython_value;
  final int php_val = User_Value_Setter.profphp_value;
  final int CSS_val = User_Value_Setter.profCSS_value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(email),
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
        ),
        body: SingleChildScrollView(
            child: Container(
                height: 1200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 34, 34),
                ),
                //padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
                child: Column(children: <Widget>[
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Column(children: <Widget>[
                            SizedBox(height: 5),
                            Text('Company: ' + company,
                                style: TextStyle(color: Colors.black)),
                            SizedBox(height: 5),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  logo.url!,
                                  height: 260,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fitHeight,
                                )),
                          ]))),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF8A2387),
                                  Color(0xFFE94057),
                                  Color(0xFFF27121),
                                ]),
                          ),
                          child: Column(children: <Widget>[
                            SizedBox(height: 10),
                            Text('Relevant Qualifications: ' + bio,
                                style: TextStyle(color: Colors.black)),
                            SizedBox(height: 10),
                            Row(children: <Widget>[
                              SizedBox(width: 242),
                              Container(
                                  width: 100,
                                  child: Text('C',
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  width: 100,
                                  child: Text('Java',
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  width: 100,
                                  child: Text('Python',
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  width: 100,
                                  child: Text('PHP',
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  width: 100,
                                  child: Text('CSS',
                                      style: TextStyle(color: Colors.white))),
                            ]),
                            Row(children: <Widget>[
                              SizedBox(width: 200),
                              Container(
                                  width: 100,
                                  child: Checkbox(value: C, onChanged: null)),
                              Container(
                                  width: 100,
                                  child:
                                      Checkbox(value: java, onChanged: null)),
                              Container(
                                  width: 100,
                                  child:
                                      Checkbox(value: python, onChanged: null)),
                              Container(
                                  width: 100,
                                  child: Checkbox(value: php, onChanged: null)),
                              Container(
                                  width: 100,
                                  child: Checkbox(value: CSS, onChanged: null)),
                            ]),
                            SizedBox(height: 10),
                            Row(children: <Widget>[
                              SizedBox(width: 242),
                              Container(
                                  width: 100,
                                  child: Text(C_val.toString() + '0% match',
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  width: 100,
                                  child: Text(java_val.toString() + '0% match',
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  width: 100,
                                  child: Text(
                                      python_val.toString() + '0% match',
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  width: 100,
                                  child: Text(php_val.toString() + '0% match',
                                      style: TextStyle(color: Colors.white))),
                              Container(
                                  width: 100,
                                  child: Text(CSS_val.toString() + '0% match',
                                      style: TextStyle(color: Colors.white))),
                            ]),
                          ]))),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 750,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 34, 34, 34),
                            borderRadius: BorderRadius.circular(0)),
                        child: Column(children: <Widget>[
                          SizedBox(height: 10),
                          Text('Basic company bio: ' + bio,
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 20),
                          Text('Description: ' + description,
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 20),
                          Text('Basic internship description: ' + internship,
                              style: TextStyle(color: Colors.white)),
                        ])),
                  )
                ]))));
  }
}
