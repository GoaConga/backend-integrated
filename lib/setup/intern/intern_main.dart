import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internsforyou/setup/browse/save_database.dart';

bool show = true;
final _username = TextEditingController();
final _email = TextEditingController();
final _password = TextEditingController();
final _first_name = TextEditingController();
final _last_name = TextEditingController();
final _description = TextEditingController();

bool? C = false;
bool? java = false;
bool? python = false;
bool? php = false;
bool? CSS = false;

double _C_value = 0;
double _java_value = 0;
double _python_value = 0;
double _php_value = 0;
double _CSS_value = 0;
String _database_name = 'intern_database';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(Intern_MyApp());
}

class Intern_MyApp extends StatefulWidget {
  @override
  Intern_IntroScreen createState() => Intern_IntroScreen();
}

class Intern_IntroScreen extends State<Intern_MyApp> {
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
                                    builder: (context) => Intern_01Route()),
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
                            onPressed: () => {},
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

class Intern_01Route extends StatefulWidget {
  @override
  Intern_FirstPage createState() => Intern_FirstPage();
}

class Intern_FirstPage extends State<Intern_01Route> {
  void addToDo() async {
    if (_email.text.trim().isEmpty || _password.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty email and password"),
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
                    controller: _email,
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
                    controller: _username,
                    decoration: InputDecoration(
                      labelText: 'username',
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
                    controller: _password,
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
                  MaterialPageRoute(builder: (context) => intern_02Route()),
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
    final username = _username.text.trim();
    final email = _email.text.trim();
    final password = _password.text.trim();

    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();

    if (response.success) {
      showSuccess();
    } else {
      showError(response.error!.message);
    }
  }
}

class intern_02Route extends StatefulWidget {
  @override
  Intern_SecondPage createState() => Intern_SecondPage();
}

class Intern_SecondPage extends State<intern_02Route> {
  void addToDo() async {
    if (_first_name.text.trim().isEmpty ||
        _last_name.text.trim().isEmpty ||
        _description.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty first/last/description"),
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
                            controller: _first_name,
                            decoration: InputDecoration(
                              labelText: 'First Name',
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
                            controller: _last_name,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
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
                                controller: _description,
                                minLines: 20,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  labelText: 'Basic internship description',
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
                          MaterialPageRoute(
                              builder: (context) => Intern_03Route()),
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

class Intern_03Route extends StatefulWidget {
  @override
  Intern_ThirdPage createState() => Intern_ThirdPage();
}

class Intern_ThirdPage extends State<Intern_03Route> {
  void addToDo() async {
    if (_first_name.text.trim().isEmpty ||
        _last_name.text.trim().isEmpty ||
        _description.text.trim().isEmpty) {
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
            FlatButton(
              minWidth: 300.0,
              height: 70.0,
              onPressed: () {
                addToDo();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Intern_04Route()),
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

class Intern_04Route extends StatefulWidget {
  @override
  Intern_FourthPage createState() => Intern_FourthPage();
}

class Intern_FourthPage extends State<Intern_04Route> {
  void addToDo() async {
    if (_first_name.text.trim().isEmpty ||
        _last_name.text.trim().isEmpty ||
        _description.text.trim().isEmpty) {
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
              height: 600,
              width: 600,
              child: Slider_MyApp(),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              minWidth: 300.0,
              height: 70.0,
              onPressed: () {
                addToDo();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Intern_05Route()),
                );
              },
              color: Colors.red,
              padding: EdgeInsets.all(10.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  //Image.asset('images/img_intern1a1.png'),
                  Text("Finalize")
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Intern_05Route extends StatefulWidget {
  @override
  Intern_FifthPage createState() => Intern_FifthPage();
}

class Intern_FifthPage extends State<Intern_05Route> {
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
                        Save_User_Signup_Data.prof_is_intern = true;
                        Save_User_Signup_Data.prof_username =
                            _username.text.trim();
                        Save_User_Signup_Data.prof_email = _email.text.trim();
                        Save_User_Signup_Data.prof_password =
                            _password.text.trim();
                        Save_User_Signup_Data.prof_company = '';
                        Save_User_Signup_Data.prof_bio = '';
                        Save_User_Signup_Data.prof_internship = '';
                        Save_User_Signup_Data.prof_description =
                            _description.text.trim();
                        Save_User_Signup_Data.prof_C = C;
                        Save_User_Signup_Data.prof_java = java;
                        Save_User_Signup_Data.prof_python = python;
                        Save_User_Signup_Data.prof_php = php;
                        Save_User_Signup_Data.prof_CSS = CSS;
                        Save_User_Signup_Data.prof_C_value = _C_value;
                        Save_User_Signup_Data.prof_java_value = _java_value;
                        Save_User_Signup_Data.prof_python_value = _python_value;
                        Save_User_Signup_Data.prof_php_value = _php_value;
                        Save_User_Signup_Data.prof_CSS_value = _CSS_value;
                        Save_User_Signup_Data.prof_database_name =
                            _database_name;
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
                    ),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}

class CheckboxesRoute extends StatefulWidget {
  @override
  Intern_CheckBoxes createState() => Intern_CheckBoxes();
}

class Intern_CheckBoxes extends State<CheckboxesRoute> {
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
                value: C,
                onChanged: (val) {
                  setState(() {
                    C = val;
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
                value: java,
                onChanged: (val) {
                  setState(() {
                    java = val;
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
                value: python,
                onChanged: (val) {
                  setState(() {
                    python = val;
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
                value: php,
                onChanged: (val) {
                  setState(() {
                    php = val;
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
                value: CSS,
                onChanged: (val) {
                  setState(() {
                    CSS = val;
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
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(
        'C',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 20,
      ),
      Slider(
        value: _C_value,
        min: 0,
        max: 10,
        divisions: 4,
        label: _C_value.toString(),
        activeColor: Colors.red,
        thumbColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            _C_value = value;
          });
        },
      ),
      Text(
        'Java',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 20,
      ),
      Slider(
        value: _java_value,
        min: 0,
        max: 10,
        divisions: 4,
        label: _java_value.toString(),
        activeColor: Colors.red,
        thumbColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            _java_value = value;
          });
        },
      ),
      Text(
        'Python',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 20,
      ),
      Slider(
        value: _python_value,
        min: 0,
        max: 10,
        divisions: 4,
        label: _python_value.toString(),
        activeColor: Colors.red,
        thumbColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            _python_value = value;
          });
        },
      ),
      Text(
        'PHP',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 20,
      ),
      Slider(
        value: _php_value,
        min: 0,
        max: 10,
        divisions: 4,
        label: _php_value.toString(),
        activeColor: Colors.red,
        thumbColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            _php_value = value;
          });
        },
      ),
      Text(
        'CSS',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 20,
      ),
      Slider(
        value: _CSS_value,
        min: 0,
        max: 10,
        divisions: 4,
        label: _CSS_value.toString(),
        activeColor: Colors.red,
        thumbColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            _CSS_value = value;
          });
        },
      )
    ]));
  }
}
