import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/models/job_listing/job_listing.dart';
import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/screens/browse/controller.dart';
import 'package:internsforyou/screens/browse/widgets/qualification_widget.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';


class InternshipScreen extends GetView<BrowseController> {
  const InternshipScreen({Key? key, required this.internship}) : super(key: key);
  final JobListing internship;

 int getScore() {
    double score = 0;
    for (Skills skill in internship.skillsRequired) {
      score += skill.skillProficiency;
    }
    return score~/internship.skillsRequired.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(internship.jobTitle,
                    style: IFYFonts.introHeader),
        centerTitle: true,
        backgroundColor: IFYColors.accentRed,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                  Container(
                    decoration: BoxDecoration(color: IFYColors.accentRed),
                    alignment: Alignment.topCenter,
                    constraints: BoxConstraints(minWidth: boxConstraints.maxWidth),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: const Image(
                            image: AssetImage('images/company.png')
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: Stack(
                              fit: StackFit.expand,
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  backgroundColor: const Color.fromARGB(255, 196, 196, 196),
                                  color: IFYColors.accentRed,
                                  strokeWidth: 18,
                                  value: getScore()/100,
                                ),
                                Center(
                                  child: Text(getScore().toString() + "%",
                                    style: IFYFonts.profileMainScoreText),
                                ),
                              ]
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: IFYColors.accentRed,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 3, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              prototypeItem: QualWidget(skill: Skills(skillName: 'test', skillProficiency: 0)),
                              itemBuilder: (BuildContext context, index) {
                                return QualWidget(skill: internship.skillsRequired[index],);
                              }
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: IFYButtons.primaryAltbutton,
                                child: const Text('Message')),
                              ElevatedButton(
                                onPressed: () {},
                                style: IFYButtons.secondaryAltbutton,
                                child: const Text('Call'))
                            ]
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(internship.jobDescription,
                        softWrap: true,
                        maxLines: 12,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                          style: IFYFonts.internListDescriptionText.apply(fontSizeDelta: 5),),
                  )
              ]
            ),
          );
        }
      )
    );
  }
}