import 'package:flutter/material.dart';
import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';

class QualWidget extends StatefulWidget {
  final Skills skill;
  const QualWidget({ Key? key, required this.skill }) : super(key: key);

  @override
  _QualWidgetState createState() => _QualWidgetState();
}

class _QualWidgetState extends State<QualWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: const Color.fromARGB(100, 196, 196, 196),
                    color: Colors.white,
                    strokeWidth: 5,
                    value: widget.skill.skillProficiency/100,
                  ),
                  Center(
                    child: Text(widget.skill.skillProficiency.toString(),
                      style: IFYFonts.scoreButtonText),
                  ),
                ]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(widget.skill.skillName,
              style: IFYFonts.profileQualText),
          )
        ],
      ),
    );
  }
}