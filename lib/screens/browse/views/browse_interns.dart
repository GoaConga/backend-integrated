import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/models/student/student.dart';
import 'package:internsforyou/screens/browse/controller.dart';
import 'package:internsforyou/screens/browse/widgets/intern_tile.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';


class BrowseInternScreen extends GetView<BrowseController> {
  const BrowseInternScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Browsing Interns', style: IFYFonts.introHeader),
          centerTitle: true,
          backgroundColor: IFYColors.accentRed,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: RefreshIndicator(
              onRefresh: () { throw Exception('Test');},           
              child: ListView.builder(
                clipBehavior: Clip.hardEdge,
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  //return InternWidget(intern: Student(score: 100-(0+index*5)));
                  return InternTile(intern: Student(score: 100-(0+index*5)), 
                  // onTap: () => Get.toNamed(AppRoutes.showInternScreen,arguments: { Student()}),
                  onTap:  () {
                    controller.currentStudent.value = Student(score: 100-(0+index*5));
                    controller.currentStudent.value.bio = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sodales lacus ut odio porttitor, eget convallis nisl finibus. Quisque cursus libero non porta efficitur. Pellentesque tincidunt condimentum viverra. Quisque tristique ornare sollicitudin. Mauris ullamcorper ut diam ut gravida. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id nibh nec enim faucibus mattis sed at tortor. Aenean malesuada dolor metus, ut dignissim risus ullamcorper quis. Praesent sed magna quis eros semper dictum quis vitae mi. Maecenas dolor libero, efficitur eu auctor at, molestie sit amet ipsum. In tincidunt tempor pellentesque. Morbi posuere tempus odio, sed dictum nulla sollicitudin ac. Duis volutpat velit vitae massa bibendum, vel sollicitudin sapien ultricies. Sed ultrices sapien at risus dapibus, nec viverra risus volutpat. Morbi finibus fermentum ullamcorper. Sed fringilla tristique metus, ut imperdiet diam lobortis ultricies.';
                    controller.currentStudent.value.skills = [
                      Skills(skillName: 'Flutter', skillProficiency: 100),
                      Skills(skillName: 'java', skillProficiency: 75),
                      Skills(skillName: 'HTML', skillProficiency: 50),
                      Skills(skillName: 'CSS', skillProficiency: 20),
                    ];
                    Get.toNamed(AppRoutes.showInternScreen);
                  },
                  ); //TODO: Draw from actual list of students.
                }
              ),
            ),
          ),
        ),
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
                decoration: BoxDecoration(
                  color: IFYColors.accentRed
                ),
                child: Text('Interns For You', style: IFYFonts.introHeader,)
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.search, color: Colors.white,),
                title: Text('Browse', style: IFYFonts.imageButtonText,),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.manage_accounts, color: Colors.white,),
                title: Text('My Account', style: IFYFonts.imageButtonText,),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.exit_to_app, color: Colors.white,),
                title: Text('Sign Out', style: IFYFonts.imageButtonText,),
              )
            ],
          ),
        ),
      )
    );
  }
}