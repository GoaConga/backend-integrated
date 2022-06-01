import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:internsforyou/models/student/skills.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';


class SkillSlider extends StatefulWidget {
  final Skills skill;
  SkillSlider({ Key? key, required this.skill,}) : super(key: key);

  @override
  State<SkillSlider> createState() => _SkillSliderState();
}

class _SkillSliderState extends State<SkillSlider> {
  
  @override
  Widget build(BuildContext context) {
    return Card(  
      color: Colors.transparent,
      shadowColor: Colors.transparent,  
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
            child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.skill.skillName.toLowerCase(),
              style: IFYFonts.inputPreText,),),
          ),
          Slider(
            label: widget.skill.skillProficiency.round().toString() + "%",
            divisions: 10,
            activeColor: IFYColors.accentRed,
            inactiveColor: IFYColors.buttonGray,
            max: 100,
            value: widget.skill.skillProficiency.toDouble(),
            onChanged: (double value) {
            setState(() {
              widget.skill.skillProficiency = value.toInt();
            });
          }),
        ],
      )
      );
  }
}