import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:internsforyou/setup/browse/save_database.dart';

class Internship_Static {
  static bool show = true;
  static final _username = TextEditingController();
  static final _email = TextEditingController();
  static final _password = TextEditingController();
  static final _company = TextEditingController();
  static final _bio = TextEditingController();
  static final _internship = TextEditingController();
  static final _description = TextEditingController();
  static bool? C = false;
  static bool? java = false;
  static bool? python = false;
  static bool? php = false;
  static bool? CSS = false;
  static String _database_name = 'intern_database';

  static int intval_C = 0;
  static int intval_java = 0;
  static int intval_python = 0;
  static int intval_php = 0;
  static int intval_CSS = 0;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  //show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(Internship_MyApp());
}

class Internship_MyApp extends StatefulWidget {
  @override
  Internship_IntroScreen createState() => Internship_IntroScreen();
}

class Internship_IntroScreen extends State<Internship_MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 34, 34),
                ),
                padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
                child: SizedBox(
                    height: 800,
                    width: 400,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlatButton(
                            minWidth: 300.0,
                            height: 70.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstRoute()),
                              );
                            },
                            color: Colors.red,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                //Image.asset('images/img_intern1a1.png'),
                                Text("Setup Accout")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                            minWidth: 300.0,
                            height: 70.0,
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => FlutterHome()),
                              // );
                            },
                            color: Colors.grey,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                //Image.asset('images/img_intern1a1.png'),
                                Text("Continue Anonymously")
                              ],
                            ),
                          ),
                        ])))));
  }
}

class FirstRoute extends StatefulWidget {
  @override
  Internship_FirstPage createState() => Internship_FirstPage();
}

class Internship_FirstPage extends State<FirstRoute> {
  void addToDo() async {
    if (Internship_Static._username.text.trim().isEmpty ||
        Internship_Static._email.text.trim().isEmpty ||
        Internship_Static._password.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty username/email/password"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 250,
                  child: TextField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    controller: Internship_Static._email,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      suffixIcon: Icon(
                        Icons.mail,
                        size: 20,
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 30),
            Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 250,
                  child: TextField(
                    autocorrect: true,
                    textCapitalization: TextCapitalization.sentences,
                    controller: Internship_Static._username,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      suffixIcon: Icon(
                        Icons.person,
                        size: 20,
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 30),
            Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 250,
                  child: TextField(
                    autocorrect: true,
                    textCapitalization: TextCapitalization.sentences,
                    controller: Internship_Static._password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Passwords',
                      suffixIcon: Icon(
                        Icons.key,
                        size: 20,
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 30),
            FlatButton(
              minWidth: 300.0,
              height: 70.0,
              onPressed: () {
                addToDo();
                doUserRegistration();
              },
              color: Colors.red,
              padding: EdgeInsets.all(10.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  //Image.asset('images/img_intern1a1.png'),
                  Text("Next")
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("User was successfully created!"),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserRegistration() async {
    final username = Internship_Static._username.text.trim();
    final email = Internship_Static._email.text.trim();
    final password = Internship_Static._password.text.trim();

    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();

    if (response.success) {
      showSuccess();
    } else {
      showError(response.error!.message);
    }
  }
}

class SecondRoute extends StatefulWidget {
  @override
  Internship_SecondPage createState() => Internship_SecondPage();
}

class Internship_SecondPage extends State<SecondRoute> {
  void addToDo() async {
    if (Internship_Static._company.text.trim().isEmpty ||
        Internship_Static._bio.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty company and bio"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 250,
                          child: TextField(
                            controller: Internship_Static._company,
                            decoration: InputDecoration(
                              labelText: 'Not a real company TLC',
                              suffixIcon: Icon(
                                Icons.person,
                                size: 20,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 30),
                    Container(
                        height: 400,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            width: 250,
                            height: 300,
                            child: TextFormField(
                                controller: Internship_Static._bio,
                                minLines: 20,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  labelText: 'What does your company do?',
                                  suffixIcon: Icon(
                                    Icons.comment,
                                    size: 20,
                                  ),
                                )))),
                    SizedBox(height: 30),
                    FlatButton(
                      minWidth: 300.0,
                      height: 70.0,
                      onPressed: () {
                        addToDo();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThirdRoute()),
                        );
                      },
                      color: Colors.red,
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          //Image.asset('images/img_intern1a1.png'),
                          Text("Next")
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}

class ThirdRoute extends StatefulWidget {
  @override
  Internship_ThirdPage createState() => Internship_ThirdPage();
}

class Internship_ThirdPage extends State<ThirdRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      minWidth: 300.0,
                      height: 70.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FourthRoute()),
                        );
                      },
                      color: Colors.red,
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          //Image.asset('images/img_intern1a1.png'),
                          Text("Add Internship")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      minWidth: 300.0,
                      height: 70.0,
                      onPressed: () => {},
                      color: Colors.grey,
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          //Image.asset('images/img_intern1a1.png'),
                          Text("Browse Interns")
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}

class FourthRoute extends StatefulWidget {
  @override
  Internship_FourthPage createState() => Internship_FourthPage();
}

class Internship_FourthPage extends State<FourthRoute> {
  void addToDo() async {
    if (Internship_Static._internship.text.trim().isEmpty ||
        Internship_Static._description.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty internship and description"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 250,
                  child: TextField(
                    controller: Internship_Static._internship,
                    decoration: InputDecoration(
                      labelText: 'Internship title',
                      suffixIcon: Icon(
                        Icons.person,
                        size: 20,
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 30),
            Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                    width: 250,
                    height: 300,
                    child: TextFormField(
                        controller: Internship_Static._description,
                        minLines: 20,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'Basic Internship description',
                          suffixIcon: Icon(
                            Icons.comment,
                            size: 20,
                          ),
                        )))),
            SizedBox(height: 30),
            FlatButton(
              minWidth: 300.0,
              height: 70.0,
              onPressed: () {
                addToDo();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FifthRoute()),
                );
              },
              color: Colors.red,
              padding: EdgeInsets.all(10.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  //Image.asset('images/img_intern1a1.png'),
                  Text("Next")
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class FifthRoute extends StatefulWidget {
  @override
  Internship_FifthPage createState() => Internship_FifthPage();
}

class Internship_FifthPage extends State<FifthRoute> {
  void addToDo() async {
    if (Internship_Static._internship.text.trim().isEmpty ||
        Internship_Static._description.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty internship and description"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 510,
              child: CheckboxesRoute(),
            ),
            SizedBox(height: 30),
            Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: FlatButton(
                  minWidth: 300.0,
                  height: 70.0,
                  onPressed: () {
                    trueCheck();
                    Save_User_Signup_Data.prof_is_intern = false;
                    Save_User_Signup_Data.prof_username =
                        Internship_Static._username.text.trim();
                    Save_User_Signup_Data.prof_email =
                        Internship_Static._email.text.trim();
                    Save_User_Signup_Data.prof_password =
                        Internship_Static._password.text.trim();
                    Save_User_Signup_Data.prof_company =
                        Internship_Static._company.text.trim();
                    Save_User_Signup_Data.prof_bio =
                        Internship_Static._bio.text.trim();
                    Save_User_Signup_Data.prof_internship =
                        Internship_Static._internship.text.trim();
                    Save_User_Signup_Data.prof_description =
                        Internship_Static._description.text.trim();
                    Save_User_Signup_Data.prof_C = Internship_Static.C;
                    Save_User_Signup_Data.prof_java = Internship_Static.java;
                    Save_User_Signup_Data.prof_python =
                        Internship_Static.python;
                    Save_User_Signup_Data.prof_php = Internship_Static.php;
                    Save_User_Signup_Data.prof_CSS = Internship_Static.CSS;
                    Save_User_Signup_Data.prof_C_value =
                        Internship_Static.intval_C.toDouble();
                    Save_User_Signup_Data.prof_java_value =
                        Internship_Static.intval_java.toDouble();
                    Save_User_Signup_Data.prof_python_value =
                        Internship_Static.intval_python.toDouble();
                    Save_User_Signup_Data.prof_php_value =
                        Internship_Static.intval_php.toDouble();
                    Save_User_Signup_Data.prof_CSS_value =
                        Internship_Static.intval_CSS.toDouble();
                    Save_User_Signup_Data.prof_database_name =
                        Internship_Static._database_name;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplaySaveGalleryPage()),
                    );
                  },
                  color: Colors.red,
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      //Image.asset('images/img_intern1a1.png'),
                      Text("Upload a photo to start")
                    ],
                  ),
                )),
          ],
        ),
      ),
    ));
  }

  void trueCheck() {
    List<dynamic> listTruth = [
      Internship_Static.C,
      Internship_Static.java,
      Internship_Static.python,
      Internship_Static.php,
      Internship_Static.CSS
    ];
    List<dynamic> Value_language = [
      Internship_Static.intval_C,
      Internship_Static.intval_java,
      Internship_Static.intval_python,
      Internship_Static.intval_php,
      Internship_Static.intval_CSS
    ];
    int var_in = 0;
    while (var_in != 4) {
      if (listTruth[var_in] == true) {
        Value_language[var_in] = 10;
      } else {
        Value_language[var_in] = 0;
      }
      var_in = var_in + 1;
    }
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
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white60, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              CheckboxListTile(
                value: Internship_Static.C,
                onChanged: (val) {
                  setState(() {
                    Internship_Static.C = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("C"),
                subtitle: Text("Day 1"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
              CheckboxListTile(
                value: Internship_Static.java,
                onChanged: (val) {
                  setState(() {
                    Internship_Static.java = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("Java"),
                subtitle: Text("Day 2"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
              CheckboxListTile(
                value: Internship_Static.python,
                onChanged: (val) {
                  setState(() {
                    Internship_Static.python = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("Python"),
                subtitle: Text("Day 3"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
              CheckboxListTile(
                value: Internship_Static.php,
                onChanged: (val) {
                  setState(() {
                    Internship_Static.php = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("PHP"),
                subtitle: Text("Day 3"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
              CheckboxListTile(
                value: Internship_Static.CSS,
                onChanged: (val) {
                  setState(() {
                    Internship_Static.CSS = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("CSS"),
                subtitle: Text("Day 3"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
            ])),
      )
    ]);
  }
}
