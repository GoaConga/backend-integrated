import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/models/student/qualifications.dart';
import 'package:internsforyou/models/student/social_media.dart';

class Student {
  late String firstName;
  late String lastName;
  late int contactNumber;
  late String email;
  late String password;
  late List<Skills> skills;
  late List<Qualifications> qualifications;
  late DateTime dob;
  late String bio;
  late SocialMedia socialMedia;
  String displayImage;
  late int score;

  Student({
    this.firstName = 'John',
    this.lastName = 'Smith',
    this.bio = 'Placeholder bio',
    this.score = 0,
    this.skills = const [],
    this.displayImage = 'images/intern.png'
  });
}
