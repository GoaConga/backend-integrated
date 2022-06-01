import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/models/job_listing/job_listing.dart';
import 'package:internsforyou/screens/browse/controller.dart';
import 'package:internsforyou/screens/browse/widgets/internship_tile.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';


class BrowseInternShipScreen extends GetView<BrowseController> {
  const BrowseInternShipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Browsing Internships', style: IFYFonts.introHeader),
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
                  return InternshipTile(internship: JobListing(score: 100-(0+index*5))); //TODO: Return actual list of internships
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