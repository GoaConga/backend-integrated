import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';

class SkillTile extends StatefulWidget {
  final Skills skill;
  bool isChecked = false;
  SkillTile({ Key? key, required this.skill, required this.isChecked }) : super(key: key);

  @override
  State<SkillTile> createState() => _SkillTileState();
}

class _SkillTileState extends State<SkillTile> {
  @override
  Widget build(BuildContext context) {
    return Card(      
      child: CheckboxListTile(
        title: Text(widget.skill.skillName, style: IFYFonts.skillListName),
        value: widget.isChecked,
        onChanged: (bool? value) {
          setState(() {
            widget.isChecked = value!;
          });
        }
      )
    );
  }
}