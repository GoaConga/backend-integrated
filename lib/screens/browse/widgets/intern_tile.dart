import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:internsforyou/models/student/student.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';

class Static_InternTile {
  static late String intern_first;
  static late String intern_last;
  static late String intern_bio;
}

class InternTile extends StatefulWidget {
  final Student intern;
  const InternTile({Key? key, required this.intern, required this.onTap})
      : super(key: key);
  final VoidCallback onTap;

  @override
  State<InternTile> createState() => _InternTileState();
}

class _InternTileState extends State<InternTile> {
  @override
  Widget build(BuildContext context) {
    //widget.intern.firstName = 'first'; //Static_InternTile.intern_first;
    //widget.intern.lastName = 'last'; //Static_InternTile.intern_last;
    widget.intern.bio =
        'bio started in intern_tile dart file'; //Static_InternTile.intern_bio;
    return Card(
      child: ListTile(
        onTap: widget.onTap,
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: const Color.fromARGB(255, 196, 196, 196),
                  color: IFYColors.accentRed,
                  strokeWidth: 5,
                  value: widget.intern.score / 100,
                ),
                Center(
                  child: Text(widget.intern.score.toString(),
                      style: IFYFonts.scoreButtonText),
                ),
              ]),
        ),
        title: Text(widget.intern.firstName + ' ' + widget.intern.lastName,
            style: IFYFonts.internListNameText),
        subtitle: Text(
          widget.intern.bio,
          maxLines: 2,
          style: IFYFonts.internListDescriptionText,
        ),
        isThreeLine: true,
        tileColor: IFYColors.buttonGray,
      ),
    );
  }
}
