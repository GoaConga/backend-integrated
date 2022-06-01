import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:internsforyou/setup/browse/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'Kj9eT8bzLnfOk4tTjRPFrnrRoOdUONFb5Es4c8vY';
  final keyClientKey = 'TInUGQ88j0d7hUrpuDoxj8kOdOwceBtSwEglmmgr';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(MaterialApp(
    home: Browse_Home(),
  ));
}

class Browse_Home extends StatefulWidget {
  @override
  _BrowseHomeState createState() => _BrowseHomeState();
}

class _BrowseHomeState extends State<Browse_Home> {
  List<ParseObject> results = <ParseObject>[];
  final todo_username_controller = TextEditingController();

  void addToDo() async {
    if (todo_username_controller.text.trim().isEmpty) {
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
    parseQuery.whereContains(
        dropdownvalue, todo_username_controller.text.trim());

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

  String dropdownvalue = 'username';

  // List of items in our dropdown menu
  var items = [
    'username',
    'company',
    //'bio',
    'internship',
    'description',
    'email',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Browsing Internships'),
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 34, 34, 34),
          ),
          //padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                  child: Row(
                    children: <Widget>[
                      DropdownButton(
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                      Expanded(
                        child: TextField(
                          autocorrect: true,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(color: Colors.white),
                          controller: todo_username_controller,
                          decoration: InputDecoration(
                              labelText: "Search for " + dropdownvalue,
                              labelStyle: TextStyle(color: Colors.blueAccent)),
                        ),
                      ),
                      Container(
                          width: 88,
                          child: Text('Result:   ${results.length}   ',
                              style: TextStyle(color: Colors.blue))),
                      ElevatedButton.icon(
                          icon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 255, 0, 0),
                            size: 40.0,
                          ),
                          label: Text('Search'),
                          onPressed: doQueryByName,
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ))
                    ],
                  )),
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
                                    final varEmail =
                                        varTodo.get<String>('email')!;
                                    final varCompany =
                                        varTodo.get<String>('company')!;
                                    final varLogo =
                                        varTodo.get<ParseFileBase>('file')!;
                                    final varDescription =
                                        varTodo.get<String>('description')!;
                                    final varBio = varTodo.get<String>('bio')!;
                                    final varInternship =
                                        varTodo.get<String>('internship')!;
                                    final varIs_Intern =
                                        varTodo.get<bool>('intern')!;
                                    final varC = varTodo.get<bool>('C')!;
                                    final varJava = varTodo.get<bool>('java')!;
                                    final varPython =
                                        varTodo.get<bool>('python')!;
                                    final varPhp = varTodo.get<bool>('php')!;
                                    final varCSS = varTodo.get<bool>('CSS')!;
                                    final varC_value =
                                        varTodo.get<int>('C_value')!;
                                    final varjava_value =
                                        varTodo.get<int>('java_value')!;
                                    final varpython_value =
                                        varTodo.get<int>('python_value')!;
                                    final varphp_value =
                                        varTodo.get<int>('php_value')!;
                                    final varCSS_value =
                                        varTodo.get<int>('CSS_value')!;
                                    //*************************************

                                    return Container(
                                        padding: EdgeInsets.fromLTRB(
                                            17.0, 1.0, 7.0, 1.0),
                                        child: Column(children: <Widget>[
                                          Container(
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                  width: 250,
                                                  child: ListTile(
                                                    title: Column(
                                                        children: <Widget>[
                                                          Container(
                                                              width: 500,
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                      width:
                                                                          300,
                                                                      child: Text(
                                                                          'Email: ' +
                                                                              varEmail,
                                                                          style:
                                                                              TextStyle(color: Colors.white))),
                                                                  Container(
                                                                      width:
                                                                          200,
                                                                      child: Text(
                                                                          'Company: ' +
                                                                              varCompany,
                                                                          style:
                                                                              TextStyle(color: Colors.white))),
                                                                ],
                                                              )),
                                                          Container(
                                                              width: 500,
                                                              child: Text(
                                                                  'Description: ' +
                                                                      varDescription,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white))),
                                                        ]),
                                                    leading: CircleAvatar(
                                                      child: Icon(varIs_Intern
                                                          ? Icons.check
                                                          : Icons.error),
                                                      backgroundColor:
                                                          varIs_Intern
                                                              ? Colors.green
                                                              : Colors.blue,
                                                      foregroundColor:
                                                          Colors.white,
                                                    ),
                                                    trailing: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        GestureDetector(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                gradient: LinearGradient(
                                                                    begin: Alignment
                                                                        .centerLeft,
                                                                    end: Alignment
                                                                        .centerRight,
                                                                    colors: [
                                                                      Color(
                                                                          0xFF8A2387),
                                                                      Color(
                                                                          0xFFE94057),
                                                                      Color(
                                                                          0xFFF27121),
                                                                    ]),
                                                              ),
                                                              child:
                                                                  MaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        User_Value_Setter.prof_email =
                                                                            varEmail;
                                                                        User_Value_Setter.prof_company =
                                                                            varCompany;
                                                                        User_Value_Setter.prof_logo =
                                                                            varLogo;
                                                                        User_Value_Setter.prof_bio =
                                                                            varBio;
                                                                        User_Value_Setter.prof_internship =
                                                                            varInternship;
                                                                        User_Value_Setter.prof_description =
                                                                            varDescription;
                                                                        User_Value_Setter.prof_C =
                                                                            varC;
                                                                        User_Value_Setter.prof_java =
                                                                            varJava;
                                                                        User_Value_Setter.prof_python =
                                                                            varPython;
                                                                        User_Value_Setter.prof_php =
                                                                            varPhp;
                                                                        User_Value_Setter.prof_CSS =
                                                                            varCSS;
                                                                        User_Value_Setter.profC_value =
                                                                            varC_value;
                                                                        User_Value_Setter.profjava_value =
                                                                            varjava_value;
                                                                        User_Value_Setter.profpython_value =
                                                                            varpython_value;
                                                                        User_Value_Setter.profphp_value =
                                                                            varphp_value;
                                                                        User_Value_Setter.profCSS_value =
                                                                            varCSS_value;
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => Search_Profile()),
                                                                        );
                                                                      },
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              20.0),
                                                                      child:
                                                                          Text(
                                                                        'View',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.normal),
                                                                      ))),
                                                        ),
                                                      ],
                                                    ),
                                                  )))
                                        ]));
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
    queryTodo.whereContains(
        dropdownvalue, todo_username_controller.text.trim());
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<void> deleteTodo(String id) async {
    var todo = ParseObject('intern_database')..objectId = id;
    await todo.delete();
  }
}
