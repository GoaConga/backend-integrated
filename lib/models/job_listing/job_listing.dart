import 'package:internsforyou/models/student/skills.dart';

class JobListing {
  late String jobTitle;
  late List<Skills> skillsRequired;
  late String jobDescription;
  late int minPay;
  late int maxPay;
  late int hours;
  late String location;
  late int positionsAvailable;
  late DateTime employmentDuration;
  late String employmentType;
  late int score;

  JobListing({
    this.jobTitle = 'Placeholder Title',
    this.jobDescription = 'Placeholder Description',
    this.score = 0,
  });
}
