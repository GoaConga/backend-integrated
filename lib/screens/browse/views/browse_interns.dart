import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/models/student/student.dart';
import 'package:internsforyou/screens/browse/controller.dart';
import 'package:internsforyou/screens/browse/views/view_intern.dart';
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
      body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: RefreshIndicator(
                  onRefresh: () {
                    throw Exception('Test');
                  },
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
                                  clipBehavior: Clip.hardEdge,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (BuildContext context, index) {
                                    final varTodo = snapshot.data![index];
                                    final varEmail =
                                        varTodo.get<String>('email')!;
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
                                    return InternTile(
                                      intern: Student(score: average),
                                      onTap: () {
                                        controller.currentStudent.value =
                                            Student(score: average);
                                        controller.currentStudent.value.email =
                                            varEmail;
                                        controller.currentStudent.value.bio =
                                            varBio;
                                        Static_InternScreen.user_login =
                                            varFile;
                                        controller.currentStudent.value.skills =
                                            [
                                          Skills(
                                              skillName: 'Flutter',
                                              skillProficiency: int.parse(
                                                  varSliderbar[0].toString())),
                                          Skills(
                                              skillName: 'java',
                                              skillProficiency: int.parse(
                                                  varSliderbar[1].toString())),
                                          Skills(
                                              skillName: 'HTML',
                                              skillProficiency: int.parse(
                                                  varSliderbar[2].toString())),
                                          Skills(
                                              skillName: 'CSS',
                                              skillProficiency: int.parse(
                                                  varSliderbar[3].toString())),
                                        ];
                                        Get.toNamed(AppRoutes.showInternScreen);
                                      },
                                    ); //TODO: Draw from actual list of students.
                                  });
                            }
                        }
                      })))),
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
              onTap: () {},
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
              onTap: () {
                Get.toNamed(AppRoutes.updateDetailScreen);
              },
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
                !Static_LoginScreen.isLoggedIn
                    ? null
                    : () => LoginScreen.doUserLogout();
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
