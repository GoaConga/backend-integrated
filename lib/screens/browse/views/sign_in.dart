import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Sign_in_Success {
  //static late String prof_username;
  static late String username_pass;
}

class Sign_in_Home extends StatefulWidget {
  @override
  _Sign_in_HomeState createState() => _Sign_in_HomeState();
}

final todoController = TextEditingController();
final String username = Sign_in_Success.username_pass;

class _Sign_in_HomeState extends State<Sign_in_Home> {
  late bool? val_intern;
  List<ParseObject> results = <ParseObject>[];

  void addToDo() async {
    if (todoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty title"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    await saveTodo(todoController.text);
    setState(() {
      todoController.clear();
    });
  }

  void doQueryByName() async {
    // Create your query
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('internsforyou'));

    // `whereContains` is a basic query method that checks if string field
    // contains a specific substring
    parseQuery.whereContains('username', username);

    // The query will resolve only after calling this method, retrieving
    // an array of `ParseObjects`, if success
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      // Let's show the results
      for (var o in apiResponse.results!) {
        print((o as ParseObject).toString());
      }

      setState(() {
        results = apiResponse.results as List<ParseObject>;
      });
    } else {
      results = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User update setting"),
          backgroundColor: Color.fromARGB(255, 243, 3, 75),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 34, 34, 34),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: FutureBuilder<List<ParseObject>>(
                      future: getTodo(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  child: CircularProgressIndicator()),
                            );
                          default:
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("Error..."),
                              );
                            }
                            if (!snapshot.hasData) {
                              return Center(
                                child: Text("No Data..."),
                              );
                            } else {
                              return ListView.builder(
                                  padding: EdgeInsets.only(top: 10.0),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    final varTodo = snapshot.data![index];
                                    final varEmail =
                                        varTodo.get<String>('email')!;
                                    final varPassword =
                                        varTodo.get<String>('password')!;
                                    final varCompany =
                                        varTodo.get<String>('company')!;
                                    final varBio = varTodo.get<String>('bio')!;
                                    final varCheckboxes = varTodo
                                        .get<List<dynamic>>('checkboxes')!;
                                    final varSliderbar = varTodo
                                        .get<List<dynamic>>('sliderbar')!;
                                    final varFile =
                                        varTodo.get<ParseFileBase>('file')!;
                                    final int average = ((varSliderbar[0] +
                                                varSliderbar[1] +
                                                varSliderbar[2] +
                                                varSliderbar[3]) /
                                            4)
                                        .floor();

                                    final con_password = TextEditingController(
                                        text: varPassword);
                                    final con_email =
                                        TextEditingController(text: varEmail);
                                    final con_company =
                                        TextEditingController(text: varCompany);
                                    final con_bio =
                                        TextEditingController(text: varBio);

                                    late double _C_value =
                                        varSliderbar[0].toDouble();
                                    late double _java_value =
                                        varSliderbar[1].toDouble();
                                    late double _python_value =
                                        varSliderbar[2].toDouble();
                                    late double _php_value =
                                        varSliderbar[3].toDouble();
                                    late double _CSS_value =
                                        varSliderbar[4].toDouble();

                                    return Column(children: <Widget>[
                                      SizedBox(height: 10),
                                      Container(
                                          height: 50,
                                          width: 450,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextField(
                                            controller: con_email,
                                            decoration: InputDecoration(
                                              labelText: "Email:",
                                              suffixIcon: Icon(
                                                Icons.person,
                                                size: 20,
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 10),
                                      Container(
                                          height: 50,
                                          width: 450,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextField(
                                            controller: con_password,
                                            decoration: InputDecoration(
                                              labelText: "Password:",
                                              suffixIcon: Icon(
                                                Icons.key,
                                                size: 20,
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 20),
                                      FlatButton(
                                        minWidth: 450.0,
                                        height: 70.0,
                                        onPressed: () {
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           ResetPasswordPage()),
                                          //);
                                        },
                                        color: Colors.red,
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          // Replace with a Row for horizontal icon + text
                                          children: <Widget>[
                                            //Image.asset('images/img_intern1a1.png'),
                                            Text("Change Password")
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                          height: 250,
                                          width: 450,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                              width: 300,
                                              height: 300,
                                              child: TextFormField(
                                                  controller: con_bio,
                                                  minLines: 20,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    labelText: 'Bio:',
                                                    suffixIcon: Icon(
                                                      Icons.comment,
                                                      size: 20,
                                                    ),
                                                  )))),
                                      SizedBox(height: 10),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('C',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  //fontWeight: FontWeight.bold
                                                )),
                                            Container(
                                                height: 50,
                                                width: 500,
                                                child: Slider(
                                                  value: _C_value,
                                                  min: 0,
                                                  max: 100,
                                                  divisions: 10,
                                                  label: _C_value.toString(),
                                                  activeColor: Colors.red,
                                                  thumbColor: Colors.red,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _C_value = value;
                                                    });
                                                  },
                                                )),
                                            Text('Java',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  //fontWeight: FontWeight.bold
                                                )),
                                            Container(
                                                height: 50,
                                                width: 500,
                                                child: Slider(
                                                  value: _java_value,
                                                  min: 0,
                                                  max: 100,
                                                  divisions: 10,
                                                  label: _java_value.toString(),
                                                  activeColor: Colors.red,
                                                  thumbColor: Colors.red,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _java_value = value;
                                                    });
                                                  },
                                                )),
                                            Text('Python',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  //fontWeight: FontWeight.bold
                                                )),
                                            Container(
                                                height: 50,
                                                width: 500,
                                                child: Slider(
                                                  value: _python_value,
                                                  min: 0,
                                                  max: 100,
                                                  divisions: 10,
                                                  label:
                                                      _python_value.toString(),
                                                  activeColor: Colors.red,
                                                  thumbColor: Colors.red,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _python_value = value;
                                                    });
                                                  },
                                                )),
                                            Text('PHP',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  //fontWeight: FontWeight.bold
                                                )),
                                            Container(
                                                height: 50,
                                                width: 500,
                                                child: Slider(
                                                  value: _php_value,
                                                  min: 0,
                                                  max: 100,
                                                  divisions: 10,
                                                  label: _php_value.toString(),
                                                  activeColor: Colors.red,
                                                  thumbColor: Colors.red,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _php_value = value;
                                                    });
                                                  },
                                                )),
                                            Text('CSS',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  //fontWeight: FontWeight.bold
                                                )),
                                            Container(
                                                height: 50,
                                                width: 500,
                                                child: Slider(
                                                  value: _CSS_value,
                                                  min: 0,
                                                  max: 100,
                                                  divisions: 10,
                                                  label: _CSS_value.toString(),
                                                  activeColor: Colors.red,
                                                  thumbColor: Colors.blue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _CSS_value = value;
                                                    });
                                                  },
                                                ))
                                          ]),
                                      SizedBox(height: 30),
                                      GestureDetector(
                                        child: Container(
                                            alignment: Alignment.center,
                                            width: 500,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(500),
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
                                                onPressed: () async {
                                                  await updateTodo(
                                                      varTodo.objectId!,
                                                      //val_intern!,
                                                      con_password.text.trim(),
                                                      con_email.text.trim(),
                                                      con_company.text.trim(),
                                                      con_bio.text.trim());
                                                  setState(() {
                                                    //Refresh UI
                                                  });
                                                },
                                                padding: EdgeInsets.all(20.0),
                                                child: Text(
                                                  'Update',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ))),
                                      ),
                                      SizedBox(height: 40)
                                    ]);
                                  });
                            }
                        }
                      }))
            ],
          ),
        )));
  }

  Future<void> saveTodo(String title) async {
    final todo = ParseObject('intern_database')
      ..set('email', title)
      ..set('java', false);
    await todo.save();
  }

  Future<List<ParseObject>> getTodo() async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('intern_database'));
    //queryTodo.whereContains('password', 'w456456');
    queryTodo.whereContains('username', username);
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<void> updateTodo(
    String id,
    String password,
    String email,
    String company,
    String bio,
    //bool intern,
  ) async {
    var todo = ParseObject('internsforyou')
      ..objectId = id
      ..set('password', password)
      ..set('email', email)
      ..set('company', company)
      ..set('bio', bio);
    //..set('intern', intern)
    await todo.save();
  }
}

class Delete_Home extends StatefulWidget {
  @override
  Delete_HomeState createState() => Delete_HomeState();
}

class Delete_HomeState extends State<Delete_Home> {
  List<ParseObject> results = <ParseObject>[];

  void addToDo() async {
    if (todoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty title"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
  }

  void doQueryByName() async {
    // Create your query
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('intern_database'));

    // `whereContains` is a basic query method that checks if string field
    // contains a specific substring
    parseQuery.whereContains('username', username);

    // The query will resolve only after calling this method, retrieving
    // an array of `ParseObjects`, if success
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      // Let's show the results
      for (var o in apiResponse.results!) {
        print((o as ParseObject).toString());
      }

      setState(() {
        results = apiResponse.results as List<ParseObject>;
      });
    } else {
      results = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User update setting"),
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 34, 34, 34),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: FutureBuilder<List<ParseObject>>(
                      future: getTodo(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  child: CircularProgressIndicator()),
                            );
                          default:
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("Error..."),
                              );
                            }
                            if (!snapshot.hasData) {
                              return Center(
                                child: Text("No Data..."),
                              );
                            } else {
                              return ListView.builder(
                                  padding: EdgeInsets.only(top: 10.0),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    //*************************************
                                    //Get Parse Object Values
                                    final varTodo = snapshot.data![index];
                                    final varUsername =
                                        varTodo.get<String>('username')!;

                                    final con_username = TextEditingController(
                                        text: varUsername);

                                    //*************************************

                                    return Column(children: <Widget>[
                                      Container(
                                          height: 50,
                                          width: 450,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextField(
                                            controller: con_username,
                                            decoration: InputDecoration(
                                              labelText: "Username:",
                                              suffixIcon: Icon(
                                                Icons.person,
                                                size: 20,
                                              ),
                                            ),
                                          )),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () async {
                                          await deleteTodo(varTodo.objectId!);
                                          setState(() {
                                            final snackBar = SnackBar(
                                              content: Text("Todo deleted!"),
                                              duration: Duration(seconds: 2),
                                            );
                                            ScaffoldMessenger.of(context)
                                              ..removeCurrentSnackBar()
                                              ..showSnackBar(snackBar);
                                          });
                                        },
                                      )
                                    ]);
                                  });
                            }
                        }
                      }))
            ],
          ),
        )));
  }

  Future<List<ParseObject>> getTodo() async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('intern_database'));
    //queryTodo.whereContains('password', 'w456456');
    queryTodo.whereContains('username', username);
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<void> deleteTodo(String id) async {
    var todo = ParseObject('User')..objectId = id;
    await todo.delete();
  }
}
