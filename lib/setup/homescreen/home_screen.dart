import 'package:flutter/material.dart';
import 'package:internsforyou/setup/guide/guide_main.dart';
import 'package:internsforyou/setup/setup_main.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:internsforyou/setup/setting/sign_in.dart';

class Home extends StatefulWidget {
  @override
  Main_HomePageState createState() => Main_HomePageState();
}

class Main_HomePageState extends State<Home> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                height: 250,
                width: 300,
                child: Image.asset(
                  'images/img_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Interns For You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 480,
                width: 325,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 143, 142, 142),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Interns For You',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please Login to Your Account',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: controllerUsername,
                        enabled: !isLoggedIn,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        autocorrect: false,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.person,
                              size: 20,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Username'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: controllerPassword,
                        enabled: !isLoggedIn,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        autocorrect: false,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.key,
                              size: 20,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Passwords'),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forget Password',
                                style:
                                    TextStyle(color: Colors.orangeAccent[700]),
                              )
                            ])),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      child: Container(
                          alignment: Alignment.center,
                          width: 250,
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
                          child: MaterialButton(
                              onPressed:
                                  isLoggedIn ? null : () => doUserLogin(),
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                          alignment: Alignment.center,
                          width: 250,
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
                          child: MaterialButton(
                              onPressed:
                                  !isLoggedIn ? null : () => doUserLogout(),
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                          alignment: Alignment.center,
                          width: 250,
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
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => Guide_MyApp()),
                                );
                              },
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ))),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //FontAwesomeIcons.facebookF,
                          Icon(
                            null,
                            color: Colors.orangeAccent[700],
                          ),
                        ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Sign_in_Success.username_pass = controllerUsername.toString();
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => Sign_in_Home()),
                // );
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
          title: const Text("User Sign In Properly Required"), // Error....
          content: Text(errorMessage),
          actions: <Widget>[
            new TextButton(
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

  void doUserLogin() async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      showSuccess("User was successfully login!");
      Sign_in_Success.username_pass = username;
      setState(() {
        isLoggedIn = true;
      });
    } else {
      showError(response.error!.message);
    }
  }

  void doUserLogout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();

    if (response.success) {
      showSuccess("User was successfully logout!");
      setState(() {
        isLoggedIn = false;
      });
    } else {
      showError(response.error!.message);
    }
  }
}
