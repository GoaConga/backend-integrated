import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/models/student/student.dart';
import 'package:internsforyou/screens/browse/controller.dart';
import 'package:internsforyou/screens/browse/widgets/intern_tile.dart';
import 'package:internsforyou/screens/login/view.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class BrowseInternScreen extends GetView<BrowseController> {
  BrowseInternScreen({Key? key}) : super(key: key);

  List<ParseObject> results = <ParseObject>[];
  final todo_username_controller = TextEditingController();

  void doQueryByName() async {
    // Create your query
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('internsforyou'));

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

      results = apiResponse.results as List<ParseObject>;
    } else {
      results = [];
    }
  }

  String dropdownvalue = 'email';

  // List of items in our dropdown menu
  var items = [
    'email',
    'company',
    'bio',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Browsing Interns', style: IFYFonts.introHeader),
        centerTitle: true,
        backgroundColor: IFYColors.accentRed,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 34, 34, 34),
              ),
              //padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: RefreshIndicator(
                      onRefresh: () {
                        throw Exception('Test');
                      },
                      //
                      //
                      //
                      //
                      child: Column(children: <Widget>[
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
                                  onChanged: (String? newValue) {
                                    dropdownvalue = newValue!;
                                  },
                                ),
                                Expanded(
                                  child: TextField(
                                    autocorrect: true,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    style: TextStyle(color: Colors.white),
                                    controller: todo_username_controller,
                                    decoration: InputDecoration(
                                        labelText:
                                            "Search for " + dropdownvalue,
                                        labelStyle: TextStyle(
                                            color: Colors.blueAccent)),
                                  ),
                                ),
                                Container(
                                    width: 88,
                                    child: Text(
                                        'Result:   ${results.length}   ',
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
                                        borderRadius:
                                            new BorderRadius.circular(20.0),
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
                                            final varTodo =
                                                snapshot.data![index];
                                            final varEmail =
                                                varTodo.get<String>('email')!;
                                            final varCompany =
                                                varTodo.get<String>('company')!;
                                            final varBio =
                                                varTodo.get<String>('bio')!;
                                            final varBox = varTodo
                                                .get<List>('checkboxes')!;
                                            final varSlider =
                                                varTodo.get<List>('sliderbar')!;
                                            final varLogo = varTodo
                                                .get<ParseFileBase>('file')!;

                                            return InternTile(
                                              intern:
                                                  Student(score: varSlider[0]),
                                              onTap: () {
                                                controller
                                                        .currentStudent.value =
                                                    Student(
                                                        score: varSlider[0]);
                                                controller.currentStudent.value
                                                    .bio = varBio;
                                                controller.currentStudent.value
                                                    .skills = [
                                                  Skills(
                                                      skillName: 'Flutter',
                                                      skillProficiency:
                                                          varSlider[0]),
                                                  Skills(
                                                      skillName: 'java',
                                                      skillProficiency:
                                                          varSlider[1]),
                                                  Skills(
                                                      skillName: 'HTML',
                                                      skillProficiency:
                                                          varSlider[2]),
                                                  Skills(
                                                      skillName: 'CSS',
                                                      skillProficiency:
                                                          varSlider[3]),
                                                ];
                                                Get.toNamed(
                                                    AppRoutes.showInternScreen);
                                              },
                                            ); //TODO: Draw from actual list of students.
                                          });
                                    }
                                }
                              }),
                        ),
                      ]))))),
      //
      //
      //
      //
      //
      //
      //
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: IFYColors.accentRed,
        child: const Icon(Icons.search),
      ),
      drawer: Drawer(
        backgroundColor: IFYColors.backgroundGrey,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: IFYColors.accentRed),
                child: Text(
                  'Interns For You',
                  style: IFYFonts.introHeader,
                )),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.browseInternScreen);
              },
              leading: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: Text(
                'Browse',
                style: IFYFonts.imageButtonText,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.manage_accounts,
                color: Colors.white,
              ),
              title: Text(
                'My Account',
                style: IFYFonts.imageButtonText,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                LoginScreen.doUserLogout();
                Get.toNamed(AppRoutes.loginScreen);
              },
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: Text(
                'Sign Out',
                style: IFYFonts.imageButtonText,
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<List<ParseObject>> getTodo() async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('internsforyou'));
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
}
